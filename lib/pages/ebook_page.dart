import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/view_page_bloc.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/lists_vo.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/pages/view_more_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/widget/book_widget.dart';
import 'package:library_app/widget/horizontal_list_view_and_title_widget.dart';
import 'package:provider/provider.dart';

class EbookPage extends StatelessWidget {
  EbookPage({required this.listVO});

  final List<ListsVO> listVO;

  void navigateToViewMorePage(String categoryName, context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<ViewMorePageBloc>.value(
            value: ViewMorePageBloc(categoryName),
            child: ViewMorePage(title: categoryName))));
  }

  void navigateToDetailsView(String category, BooksVO booksVO, context) {
    HomePageBloc homePageBloc=Provider.of(context,listen: false);
    homePageBloc.saveBookVOObjectInDetailsDatabase(booksVO,category);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
         create: (context)=> DetailsBloc(booksVO.title.toString()),
            child: const DetailsPage())));
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
                  itemCount: listVO[index].books?.length ?? 0,
                  itemBuilder: (_, index2) => GestureDetector(
                    onTap: () {
                      navigateToDetailsView(listVO[index].listName.toString(), listVO[index].books![index2], context);
                    },
                    child: BookWidget(
                      imageHeight: imageHeight,
                      width: bookWidth,
                      bookURL:
                          listVO[index].books![index2].bookImage.toString(),
                      bookName: listVO[index].books![index2].title.toString(),
                    ),
                  ),
                  onPressed: (text) {
                    navigateToViewMorePage(text, context);
                  },
                  categoryName: listVO[index].listName.toString(),
                )),
          );
  }
}
