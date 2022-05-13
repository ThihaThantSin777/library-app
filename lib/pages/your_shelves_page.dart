import 'package:flutter/material.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/pages/create_shelves_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/view_items/shelves_session_view.dart';
import 'package:library_app/widget/empty_widget.dart';
import 'package:provider/provider.dart';

class YourShelvesPage extends StatelessWidget {
  const YourShelvesPage({Key? key}) : super(key: key);

  void navigateToCreateShelvesView(ShelveVO shelveVO, context) {
    ShelveBloc shelveBloc = Provider.of(context, listen: false);
    shelveBloc.setIsShow = true;
    shelveBloc.setIsEdit=true;
    shelveBloc.getDataInShelvesVO(shelveVO.shelveName.toString());
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateShelvesPage()));
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_){
      HomePageBloc homePageBloc=Provider.of(context,listen: false);
      homePageBloc.setIsFloatingActionButtonShow=true;
    });
    return Selector<ShelveBloc, List<ShelveVO>?>(
        selector: (_, bloc) => bloc.getShelves,
        shouldRebuild: (pre,next)=>pre!=next,
        builder: (_, shelves, child) =>
            ShelvesListView(
            shelves: shelves ?? [],
            onTap: (shelveVO) {
              navigateToCreateShelvesView(shelveVO, context);
            },
          )


    );
  }
}
