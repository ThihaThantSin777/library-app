
import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/search_temp_bloc.dart';
import 'package:library_app/data/vos/debouncer/debouncer.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/search_temp_vo/search_temp_vo.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/pages/search_result_page.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/view_items/search_session_view.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  final _debouncer = Debouncer(milliseconds: 500);
void navigateBack(context){
  Navigator.of(context).pop();
}
void navigateToSearchResult(context,String title){
  SearchTempBloc searchTempBloc=Provider.of(context,listen:false);
  searchTempBloc.setCategory=[];
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SearchResultPage(title: title)));
}
void navigateToSearchResultUsingHistory(context,String title){
  if(title!=trendingText && title!=newReleasedText && title!=bookShopText){
    SearchTempBloc searchTempBloc=Provider.of(context,listen:false);
    searchTempBloc.setCategory=[];
    searchTempBloc.saveRecentSearch(title,false);
    navigateToSearchResult(context,title);
  }
}

  void navigateToDetailsView(String category, BooksVO booksVO, context) {
    SearchTempBloc searchTempBloc=Provider.of(context,listen: false);
    searchTempBloc.saveBookVOObjectInDetailsDatabase(booksVO,category);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
            create:(context)=> DetailsBloc(booksVO.title.toString()),
            child: const DetailsPage()
        )
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        leading: IconButton(
          onPressed: ()=>navigateBack(context),
          icon: const Icon(Icons.chevron_left,color: Colors.black,),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){
          }, icon: const Icon(Icons.keyboard_voice,color: Colors.black,))
        ],
        title:  TextField(
          onSubmitted: (string){
            SearchTempBloc searchTempBloc=Provider.of(context,listen:false);
            searchTempBloc.saveRecentSearch(string,true);
            navigateToSearchResult(context, string);
          },
          onChanged: (string){
            SearchTempBloc searchTempBloc=Provider.of(context,listen:false);
            _debouncer.run(() {
              searchTempBloc.searchFromNetwork(string);
            });
          },
          autofocus: true,
          decoration: const InputDecoration(
            contentPadding:  EdgeInsets.all(0),
            hintText: searchPlayBooksText,
            enabledBorder:OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.white),
            ),
            focusedBorder:OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),

      body:

      Selector<SearchTempBloc,bool>(
        selector: (_,bloc)=>bloc.getIsEmpty,
        shouldRebuild: (pre,next)=>pre!=next,
        builder: (_,isEmpty,child)=>

              ListView(
        children: [
         Visibility(
           visible: isEmpty,
             child:
             Selector<SearchTempBloc,List<SearchTempVO>?>(
               shouldRebuild: (pre,next)=>pre!=next,
                 selector: (_,bloc)=>bloc.getRecentSearch,
                 builder: (_,recentSearch,child)=>ListView.builder(
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemCount: recentSearch?.length,
                   itemBuilder: (_,index)=>SearchTempView(
                     onTap: (text){
                       navigateToSearchResultUsingHistory(context, text);
                     },
                       titleText: recentSearch?[index].name.toString()??'None',
                       iconText: recentSearch?[index].name.toString()??'None'
                   )
                 )

             )
         ),

          Visibility(
              visible: !isEmpty,
              child:     Selector<SearchTempBloc,OverViewVO?>(
                  shouldRebuild: (pre,next)=>pre!=next,
                  selector: (_,bloc)=>bloc.getSearchResult,
                  builder: (_,searchResult,child)=>
              ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: searchResult?.lists?[0].books?.length,
                    itemBuilder: (_,index)=>SearchResultView(
                      onTap: (bookVO){
                        navigateToDetailsView(searchResult?.lists?[0].listName.toString()??'',bookVO,context);
                      }, booksVO: searchResult?.lists?[0].books?[index]??BooksVO.normal()
                    )
                  )
              )

          ),
        ],
      ),
      )
    );
  }

}



