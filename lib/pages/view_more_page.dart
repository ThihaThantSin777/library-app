import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/view_page_bloc.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/view_items/view_moew_session_view.dart';
import 'package:provider/provider.dart';

class ViewMorePage extends StatefulWidget {
  const ViewMorePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ViewMorePage> createState() => _ViewMorePageState();
}

class _ViewMorePageState extends State<ViewMorePage> {
  final controller = ScrollController();

  void backScreen(context) {
    Navigator.of(context).pop();
  }
  void navigateToDetailsView(String category, ViewMoreVO viewMoreVO, context) {
    ViewMorePageBloc viewMorePageBloc=Provider.of(context,listen: false);
    viewMorePageBloc.saveViewMoreVOObjectInDetailsDatabase(viewMoreVO,category);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
            create:(context)=> DetailsBloc(viewMoreVO.bookDetails?[0].title.toString()??''),
            child: const DetailsPage())));
  }


  void scrollEvent() {
    ViewMorePageBloc viewMorePageBloc = Provider.of(context, listen: false);
    controller.addListener(() {
      if (controller.position.maxScrollExtent == controller.offset) {

        viewMorePageBloc.scrollAndAddNewBooks(widget.title);
        bool isEmpty=viewMorePageBloc.getIsEmpty;
        final snackBar =
              SnackBar(
                backgroundColor: isEmpty?Colors.red:Colors.blue,
                  content: ChangeNotifierProvider.value(
                    value: ViewMorePageBloc(widget.title),
                    child: (isEmpty) ?const Text(noBookText): const Text(addBookText)

                  ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  void initState() {

    super.initState();
    scrollEvent();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => backScreen(context),
            icon: const Icon(
              Icons.chevron_left,
              color: Colors.black,
            ),
          ),
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: Selector<ViewMorePageBloc, List<ViewMoreVO>?>(
              selector: (_, bloc) => bloc.getViewMoreList,
              builder: (_, viewMoreList, child) =>
              viewMoreList?.isEmpty ?? true
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: padding10x, vertical: padding10x),
                child: ViewMoreGridView(
                  onTap: (viewMore){
                    navigateToDetailsView(widget.title, viewMore, context);
                  },
                  viewMoreList: viewMoreList ?? [],
                  scrollController: controller,
                ),
              )),
        ));
  }
}

