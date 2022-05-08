

import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/search_temp_bloc.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/search_temp_vo/category_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/widget/book_widget.dart';
import 'package:library_app/widget/horizontal_list_view_and_title_widget.dart';
import 'package:provider/provider.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key? key,required this.title}) : super(key: key);
  final String title;

  void backScreen(context){
    Navigator.of(context).pop();
  }

  void navigateToDetailsView(ItemsVO itemsVO, context,String category) {
    SearchTempBloc searchTempBloc=Provider.of(context,listen: false);
    searchTempBloc.saveItemVOObjectInDetailsDatabase(itemsVO);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
            create:(context)=> DetailsBloc(itemsVO.volumeInfo?.title.toString()??''),
            child: const DetailsPage())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
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
            itemBuilder: (_,index)=>
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.34,
                    child: HorizontalListViewAndTitleWidget(
                      hasViewMore: false,
                      itemCount:categoryList?[index].categoryValue?.length??0,
                      itemBuilder:  (_, index2) {

                        return GestureDetector(
                          onTap: (){
                            ItemsVO ?items=categoryList?[index].categoryValue?[index2];
                           navigateToDetailsView(items??ItemsVO.normal(), context, categoryList?[index].categoryNames.toString()=='null'?title:categoryList?[index].categoryNames.toString()??title);
                          },
                          child: BookWidget(
                              imageHeight: imageHeight,
                              width: bookWidth,
                              bookURL: categoryList?[index].categoryValue?[index2].volumeInfo?.imageLinks?.thumbnail.toString()??'',
                              bookName:categoryList?[index].categoryValue?[index2].volumeInfo?.title.toString()??''
                          ),
                        );
                      },
                      onPressed: (text){

                      },
                      categoryName: categoryList?[index].categoryNames.toString()=='null'?title:categoryList?[index].categoryNames.toString()??title,
                    )

                ),
          );
        }


      ),
    );
  }
}
