import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/bloc/view_page_bloc.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';
import 'package:library_app/pages/add_to_shelf_page.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/view_items/view_moew_session_view.dart';
import 'package:library_app/widget/menu_widget.dart';
import 'package:provider/provider.dart';

class ViewMorePage extends StatefulWidget {
  const ViewMorePage({Key? key, required this.title,required this.scaffoldKey}) : super(key: key);
  final String title;
  final GlobalKey<ScaffoldState> scaffoldKey;

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
  void navigateToAddToShelfScreen(context,ViewMoreVO viewMoreVO,String category){
    Navigator.of(context).pop();
    ViewMorePageBloc viewMorePageBloc=Provider.of(context,listen: false);
    ShelveBloc shelveBloc=Provider.of(context,listen: false);
    shelveBloc.detailsVO=viewMorePageBloc.saveViewMoreVOObjectInDetailsTypeDetailsVO(viewMoreVO, category);
    shelveBloc.setIsShow = false;
    shelveBloc.setIsEdit=false;
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddToShelfPage())).then((value) {
      if(value){
        final snackBar = SnackBar(
          backgroundColor: Colors.blue,
          content: Text('${viewMoreVO.bookDetails?[0].title.toString()} is added in the shelf'),
        );
        ScaffoldMessenger.of(widget.scaffoldKey.currentContext??context).showSnackBar(snackBar);
      }
    });

  }
  void showMenu(context,ViewMoreVO viewMoreVO,String category){
    showModalBottomSheet(context: context, builder: (context){
      return MenuWidget(
          onTap: ()=>navigateToAddToShelfScreen(context,viewMoreVO,category),

          imageURL: viewMoreVO.imageURL.toString(), imageTitle: viewMoreVO.bookDetails?[0].title.toString()??'Hello', imageType: 'E Book');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            key: const Key('back Key ViewMore'),
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
                  onPressed: (viewMoreVO)=>showMenu(context,viewMoreVO,widget.title),
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

