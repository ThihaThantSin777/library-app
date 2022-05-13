

import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/search_temp_bloc.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/data/vos/search_temp_vo/category_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/pages/add_to_shelf_page.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/widget/book_widget.dart';
import 'package:library_app/widget/horizontal_list_view_and_title_widget.dart';
import 'package:library_app/widget/menu_widget.dart';
import 'package:provider/provider.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key,required this.title,required this.scaffoldKey}) : super(key: key);
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final imageURL='https://i.giphy.com/media/xTiN0IuPQxRqzxodZm/giphy.webp';

  void backScreen(context){
    Navigator.of(context).pop();
  }

  void navigateToDetailsView(ItemsVO itemsVO, context) {
    String categoryName=itemsVO.volumeInfo?.categories?.join(',')??title;
    SearchTempBloc searchTempBloc=Provider.of(context,listen: false);
    searchTempBloc.saveItemVOObjectInDetailsDatabase(itemsVO,categoryName);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
            create:(context)=> DetailsBloc(itemsVO.volumeInfo?.title.toString()??''),
            child: const DetailsPage())));
  }

  void navigateToAddToShelfScreen(context,ItemsVO itemsVO){
    Navigator.of(context).pop();
    SearchTempBloc searchTempBloc=Provider.of(context,listen: false);
    ShelveBloc shelveBloc=Provider.of(context,listen: false);
    shelveBloc.detailsVO=searchTempBloc.saveItemVOObjectInDetailsTypeDetailsVO(itemsVO);
    shelveBloc.setIsShow = false;
    shelveBloc.setIsEdit=false;
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddToShelfPage())).then((value) {
      if(value){
        final snackBar = SnackBar(
          backgroundColor: Colors.blue,
          content: Text('${itemsVO.volumeInfo?.title.toString()} is added in the shelf'),
        );
        ScaffoldMessenger.of(scaffoldKey.currentContext??context).showSnackBar(snackBar);
      }
    });

  }
  void showMenu(context,ItemsVO itemsVO){
    showModalBottomSheet(context: context, builder: (context){
      return MenuWidget(
          onTap: ()=>navigateToAddToShelfScreen(context,itemsVO),

          imageURL: itemsVO.volumeInfo?.imageLinks?.thumbnail.toString()??imageURL, imageTitle: itemsVO.volumeInfo?.title.toString()??'Hello', imageType: 'E Book');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          key: const Key('Back Search Result'),
          onPressed: ()=>backScreen(context),
          icon: const Icon(Icons.chevron_left,color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        title: Text(title,style: const TextStyle(color: Colors.black),),
      ),
      body:
      Selector<SearchTempBloc,List<CategoryVO>?>(
        selector: (_,bloc)=>bloc.getCategory,
        builder: (_,categoryList,child){

          return categoryList?.isEmpty??true? const Center(child: CircularProgressIndicator(),):
          ListView.builder(
            itemCount: categoryList?.length,
            itemBuilder: (_,index){
              return  SizedBox(
                  height: MediaQuery.of(context).size.height * 0.34,
                  child: HorizontalListViewAndTitleWidget(
                    onTap: (text)=>debugPrint('None'),
                    keyText: '',
                    key: UniqueKey(),
                    hasViewMore: false,
                    itemCount:categoryList?[index].categoryValue?.length??0,
                    itemBuilder:  (_, index2) {
                        print(Key(categoryList?[index].categoryValue?[index2].id.toString()??'None'));
                      return GestureDetector(
                        key: Key(categoryList?[index].categoryValue?[index2].id.toString()??'None'),
                        onTap: (){
                          print(categoryList?[index].categoryValue?[index2].id.toString());
                          ItemsVO ?items=categoryList?[index].categoryValue?[index2];
                          navigateToDetailsView(items??ItemsVO.normal(), context);
                        },
                        child: BookWidget(

                          onPressed: (){
                            showMenu(context,categoryList?[index].categoryValue?[index2]??ItemsVO.normal());
                          },
                            imageHeight: imageHeight,
                            width: bookWidth,
                            bookURL: categoryList?[index].categoryValue?[index2].volumeInfo?.imageLinks?.thumbnail.toString()??imageURL,
                            bookName:categoryList?[index].categoryValue?[index2].volumeInfo?.title.toString()??''
                        ),
                      );
                    },
                    onPressed: (text){

                    },
                    categoryName: categoryList?[index].categoryNames.toString()=='null'?title:categoryList?[index].categoryNames.toString()??title,
                  )

              );
            }

          );
        }


      ),
    );
  }
}
