


import 'package:flutter/material.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/resources/strings.dart';

class SearchTempView extends StatelessWidget {
  const SearchTempView({Key? key,required this.titleText,required this.iconText,required this.onTap}) : super(key: key);
  final String iconText;
  final String titleText;
  final Function(String)onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onTap(titleText);
      },
      leading: generateIcon(iconText),
      title: Text(titleText),
    );
  }
  Icon generateIcon(String text){
    if(text==trendingText){
      return const Icon(Icons.trending_up);
    }else if(text==newReleasedText){
      return const Icon(Icons.new_releases);
    }else if(text==bookShopText){
      return const Icon(Icons.store);
    }
    return const Icon(Icons.history);
  }
}


class SearchResultView extends StatelessWidget {
  const SearchResultView({Key? key,required this.booksVO,required this.onTap}) : super(key: key);
  final BooksVO booksVO;
  final Function(BooksVO)onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        onTap(booksVO);
      },
      leading: Image.network(booksVO.bookImage.toString()),
      title: Text(booksVO.title.toString()),
      subtitle: Text(booksVO.contributor.toString()),
    );
  }
}
