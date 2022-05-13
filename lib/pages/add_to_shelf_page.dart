import 'package:flutter/material.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/pages/create_shelves_page.dart';
import 'package:library_app/widget/shelve_list_widget.dart';
import 'package:provider/provider.dart';

class AddToShelfPage extends StatelessWidget {
  const AddToShelfPage({Key? key}) : super(key: key);

  void navigateToCreateShelfView(context) {
    ShelveBloc shelveBloc = Provider.of(context, listen: false);
    shelveBloc.setIsShow = false;
    shelveBloc.setIsEdit = false;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreateShelvesPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            navigateToCreateShelfView(context);
          },
          label: Row(
            children: const [Icon(Icons.edit), Text('Add to new')],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            icon: const Icon(Icons.chevron_left, color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Add to shelf',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Selector<ShelveBloc, List<ShelveVO>?>(
          selector: (_, bloc) => bloc.getShelves,
          shouldRebuild: (pre, next) => pre != next,
          builder: (_, shelves, child) => Selector<ShelveBloc, DetailsVO?>(
              selector: (_, bloc) => bloc.detailsVO,
              shouldRebuild: (pre, next) => pre != next,
              builder: (_, details, child) => ShelveListWidget(
                  shelves: shelves ?? [],
                  onTap: (shelveVO) {
                    ShelveBloc shelveBloc = Provider.of(context, listen: false);
                    shelveBloc.saveShelfVoInShelfDatabaseBookVO(
                        shelveVO.shelveName.toString(), details);
                    Navigator.of(context).pop(true);

                  })),
        ));
  }
}
