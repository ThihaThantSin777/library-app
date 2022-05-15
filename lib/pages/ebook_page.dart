import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/bloc/view_page_bloc.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/lists_vo.dart';
import 'package:library_app/pages/add_to_shelf_page.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/pages/view_more_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/widget/book_widget.dart';
import 'package:library_app/widget/horizontal_list_view_and_title_widget.dart';
import 'package:library_app/widget/menu_widget.dart';
import 'package:provider/provider.dart';

class EbookPage extends StatelessWidget {
  EbookPage({required this.listVO,required this.scaffoldKey});

  final List<ListsVO> listVO;
  final GlobalKey<ScaffoldState> scaffoldKey;

  void navigateToViewMorePage(String categoryName, context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<ViewMorePageBloc>.value(
            value: ViewMorePageBloc(categoryName),
            child: ViewMorePage(title: categoryName,scaffoldKey: scaffoldKey,))));
  }

  void navigateToDetailsView(String category, BooksVO booksVO, context) {
    HomePageBloc homePageBloc=Provider.of(context,listen: false);
    homePageBloc.saveBookVOObjectInDetailsDatabase(booksVO,category);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
         create: (context)=> DetailsBloc(booksVO.title.toString()),
            child: const DetailsPage())));
  }

  void navigateToAddToShelfScreen(context,BooksVO bookVO,String category){
    Navigator.of(context).pop();
    HomePageBloc homePageBloc=Provider.of(context,listen: false);
    ShelveBloc shelveBloc=Provider.of(context,listen: false);
    shelveBloc.setIsShow = false;
    shelveBloc.setIsEdit=false;
    shelveBloc.detailsVO=homePageBloc.saveBookVOObjectInDetailsTypeDetailsVO(bookVO, category);
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddToShelfPage())).then((value) {
     if(value){
       final snackBar = SnackBar(
         backgroundColor: Colors.blue,
         content: Text('${bookVO.title.toString()} is added in the shelf'),
       );
       ScaffoldMessenger.of(scaffoldKey.currentContext??context).showSnackBar(snackBar);
     }
    });

  }
  void showMenu(context,BooksVO booksVO,String category){
   showModalBottomSheet(context: context, builder: (context){
     return MenuWidget(
        onTap: ()=>navigateToAddToShelfScreen(context,booksVO,category),

         imageURL: booksVO.bookImage.toString(), imageTitle: booksVO.title.toString(), imageType: 'E Book');
   });
   }

  @override
  Widget build(BuildContext context) {
    return listVO.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: listVO.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.34,
                child: HorizontalListViewAndTitleWidget(
                  onTap: (text)=> navigateToViewMorePage(text, context),
                  keyText: '${listVO[index].listID.toString()}-${listVO[index].listName.toString()}-${listVO[index].books![1].title.toString()}',
                  key: Key(listVO[index].listName.toString()),
                  itemCount: listVO[index].books?.length ?? 0,
                  itemBuilder: (_, index2) {
                    // print('${listVO[index].listID.toString()}-${listVO[index].listName.toString()}-${listVO[index].books![index2].title.toString()}');
                    // print('');
                    return    GestureDetector(
                      key: Key('${listVO[index].listID.toString()}-${listVO[index].listName.toString()}-${listVO[index].books![index2].title.toString()}'),
                      onTap: () {
                       // print('${listVO[index].listID.toString()}-${listVO[index].listName.toString()}-${listVO[index].books![index2].title.toString()}');
                        navigateToDetailsView(listVO[index].listName.toString(), listVO[index].books![index2], context);
                      },
                      child: BookWidget(
                        onPressed: (){
                          showMenu(context, listVO[index].books![index2],listVO[index].listName.toString());
                        },
                        imageHeight: imageHeight,
                        width: bookWidth,
                        bookURL:
                        listVO[index].books![index2].bookImage.toString(),
                        bookName: listVO[index].books![index2].title.toString(),
                      ),
                    );
                  },

                  onPressed: (text) {
                    navigateToViewMorePage(text, context);
                  },
                  categoryName: listVO[index].listName.toString(),
                )),
          );
  }
}
