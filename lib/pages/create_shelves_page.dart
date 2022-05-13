import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/home_page_bloc.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/data/vos/chip_vo/chip_vo.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/over_view_vo/books_vo.dart';
import 'package:library_app/data/vos/over_view_vo/over_view_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/pages/add_to_shelf_page.dart';
import 'package:library_app/pages/details_page.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/view_items/library_seesion_view.dart';
import 'package:library_app/view_items/shelves_session_view.dart';
import 'package:library_app/widget/empty_widget.dart';
import 'package:library_app/widget/library_widget.dart';
import 'package:library_app/widget/menu_widget.dart';
import 'package:provider/provider.dart';

class CreateShelvesPage extends StatelessWidget {
  CreateShelvesPage();

  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void saveShelves(context, GlobalKey<FormState> formKey, ShelveVO shelveVO) {
    if (formKey.currentState?.validate() ?? false) {
      ShelveBloc shelveBloc = Provider.of(context, listen: false);
      shelveBloc.saveShelve(shelveVO);
      Navigator.of(context).pop();
    }
  }

  void renameShelf(context, ShelveVO shelveVO) {
    _controller.text = shelveVO.shelveName.toString();
    ShelveBloc shelveBloc = Provider.of(context, listen: false);
    shelveBloc.setIsShow = false;
    shelveBloc.deleteShelf(shelveVO.shelveName.toString());
  }

  void navigateToAddToShelfScreen(context) {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddToShelfPage()));
  }

  Future<bool?> _showMyDialog(context, String shelveName) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete $shelveName ?'),
          content: const DeleteAlertBoxView(),
          actions: <Widget>[
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.black12),
                            borderRadius:
                                BorderRadius.circular(borderRadius10x))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                ),
                const SizedBox(
                  width: padding10x,
                ),
                Expanded(
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            side: const BorderSide(color: Colors.transparent),
                            borderRadius:
                                BorderRadius.circular(borderRadius10x))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    child: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Selector<ShelveBloc, ShelveVO?>(
        selector: (_, bloc) => bloc.getShelveVO,
        builder: (_, shelveVO, child) {
          return Selector<ShelveBloc, bool>(
              selector: (_, bloc) => bloc.getIsShow,
              builder: (_, isShow, child) => Scaffold(
                    backgroundColor: Colors.white,
                    appBar: AppBar(
                        elevation: 1,
                        actions: isShow
                            ? [
                                SearchView(
                                  onPressed: () {},
                                ),
                                PopupMenuButtonView(
                                  onPressed: (string) async {
                                    if (string == renameShelfText) {
                                      renameShelf(context,
                                          shelveVO ?? ShelveVO.normal());
                                    } else {
                                      bool? cond = await _showMyDialog(
                                          context,
                                          shelveVO?.shelveName.toString() ??
                                              'None');
                                      if (cond ?? false) {
                                        ShelveBloc shelveBloc =
                                            Provider.of(context, listen: false);
                                        shelveBloc.deleteShelf(
                                            shelveVO?.shelveName.toString() ??
                                                'None');
                                        Navigator.of(context).pop();
                                      }
                                    }
                                  },
                                ),
                                const SizedBox(
                                  width: padding10x,
                                )
                              ]
                            : [],
                        leading: isShow
                            ? BackButtonView(
                                onPressed: () => Navigator.of(context).pop(),
                              )
                            : SaveShelveView(
                                onPressed: () {
                                  ShelveBloc shelveBloc =
                                      Provider.of(context, listen: false);
                                  if (shelveBloc.getIsEdit) {
                                    ShelveVO shelve = ShelveVO.normal();
                                    shelve.shelveName = _controller.text;
                                    shelve.detailsVO = shelveVO?.detailsVO;
                                    shelve.dateTime = shelveVO?.dateTime;
                                    saveShelves(context, _key, shelve);
                                  } else {
                                    ShelveVO shelveVO = ShelveVO(
                                        _controller.text, [], DateTime.now());
                                    saveShelves(context, _key, shelveVO);
                                  }
                                },
                              ),
                        backgroundColor: Colors.white,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(70),
                          child: Form(
                            key: _key,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: padding20x, vertical: padding10x),
                              child: isShow
                                  ? TextFieldDataTextView(
                                      shelveVO: shelveVO ?? ShelveVO.normal())
                                  : CreateShelveTextFormFieldView(
                                      controller: _controller,
                                    ),
                            ),
                          ),
                        )),
                    body: Selector<LibraryBloc, String>(
                        selector: (_, bloc) => bloc.getPresentForm,
                        builder: (_, presentText, child) => showBodyView(
                            shelveVO ?? ShelveVO.normal(), context)),
                  ));
        });
  }

  void showMenu(context, BooksVO booksVO) {
    String imageURL = booksVO.bookImage.toString();
    String bookName = booksVO.title.toString();

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MenuWidget(
              onTap: () => navigateToAddToShelfScreen(context),
              imageURL: imageURL,
              imageTitle: bookName,
              imageType: 'E book');
        });
  }
  void navigateToDetailsView(DetailsVO detailsVO, context) {
    HomePageBloc homePageBloc = Provider.of(context, listen: false);
    homePageBloc.reSaveDetailsObject(detailsVO);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
            create: (context) => DetailsBloc(detailsVO.title.toString()),
            child: const DetailsPage())));
  }

  Widget showBooks(String title, List<DetailsVO> detailsVO, context) {
    if (title == presentGridText) {
      return GridBookView(
        onTap: (detailsVO) {
           navigateToDetailsView(detailsVO, context);
        },
        detailsVO: detailsVO,
        isLargeGrid: false,
        height: gridHeight,
        onPressed: (detailsVO) {
          // showMenu(context,detailsVO);
        },
      );
    }
    if (title == presentLargeGridText) {
      return GridBookView(
        onTap: (detailsVO) {
           navigateToDetailsView(detailsVO, context);
        },
        detailsVO: detailsVO,
        isLargeGrid: true,
        height: largeGridHeight,
        onPressed: (detailsVO) {
          //  showMenu(context,detailsVO);
        },
      );
    }
    return ListTileBooksView(
      detailsVO: detailsVO,
      onTap: (details) {
        navigateToDetailsView(details, context);
      },
      onPressed: (detailsVO) {
        //     showMenu(context,detailsVO);
      },
    );
  }

  Widget showBodyView(ShelveVO shelveVO, context) {
    if (shelveVO.detailsVO?.isEmpty ?? true) {
      return const EmptyWidget(
        text: "Tap the menu icon on a book, then select 'Add to shelf'",
        icon: Icon(
          Icons.library_add,
          color: Colors.black38,
          size: boxConstraintsForImageHeight,
        ),
      );
    }
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: Selector<LibraryBloc, String>(
            selector: (_, bloc) => bloc.getPresentForm,
            builder: (_, presentText, child) =>
                Selector<ShelveBloc, List<DetailsVO>?>(
                    selector: (_, bloc) => bloc.getDetailsVOList,
                    shouldRebuild: (pre, next) => pre != next,
                    builder: (_, detailsVO, child) => ListView(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Selector<ShelveBloc, List<ChipVO>>(
                                selector: (_, bloc) => bloc.getChips,
                                shouldRebuild: (pre, next) => pre != next,
                                builder: (_, chips, child) =>
                                    ChipShelfSessionView(
                                  chips: chips,
                                ),
                              ),
                            ),
                            LibraryWidget(
                                isShelf: true,
                                presentText: presentText,
                                widget: showBooks(
                                    presentText, detailsVO ?? [], context))
                          ],
                        ))));
  }
}


