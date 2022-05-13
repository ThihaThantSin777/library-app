import 'package:flutter/material.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/data/vos/chip_vo/chip_vo.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:library_app/widget/shelve_list_widget.dart';
import 'package:provider/provider.dart';

class ShelvesListView extends StatelessWidget {
  const ShelvesListView({Key? key, required this.shelves, required this.onTap})
      : super(key: key);
  final List<ShelveVO> shelves;
  final Function(ShelveVO) onTap;
  final imageURL =
      'https://www.artyzen.com/wp-content/uploads/2021/12/empty.jpg';
  final emptyImageURL =
      'https://i.giphy.com/media/xTiN0IuPQxRqzxodZm/giphy.webp';

  @override
  Widget build(BuildContext context) {
    return ShelveListWidget(shelves: shelves, onTap: (shelveVO)=>onTap(shelveVO));
  }
}

class CreateShelveTextFormFieldView extends StatelessWidget {
  const CreateShelveTextFormFieldView({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('Save TextField Key'),
      validator: (text) {
        if (text?.isEmpty ?? true) {
          return 'Please enter shelf name';
        }
        ShelveBloc shelveBloc = Provider.of(context, listen: false);
        if (!shelveBloc.isSaveShelveName(text.toString())) {
          return '$text is already created';
        }
        return null;
      },
      controller: controller,
      autofocus: true,
      decoration: const InputDecoration(hintText: 'Shelf name'),
    );
  }
}

class TextFieldDataTextView extends StatelessWidget {
  const TextFieldDataTextView({Key? key, required this.shelveVO})
      : super(key: key);
  final ShelveVO shelveVO;

  @override
  Widget build(BuildContext context) {
    String bookCount = '';
    if (shelveVO.detailsVO?.isEmpty??true) {
      bookCount = 'Empty';
    } else {
      int length = shelveVO.detailsVO?.length ?? 0;
      if (length <= 1) {
        bookCount = '$length book';
      } else {
        bookCount = '$length books';
      }
    }
    return ListTile(
      title: Text(shelveVO.shelveName.toString(),style: const TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
      subtitle: Text(bookCount),
    );
  }
}

class SaveShelveView extends StatelessWidget {
  SaveShelveView({required this.onPressed});

  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('Save Icon Key'),
      onPressed: () {
        onPressed();
      },
      icon: const Icon(Icons.check, color: Colors.blue),
    );
  }
}

class BackButtonView extends StatelessWidget {
  const BackButtonView({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          onPressed();
        },
        icon: const Icon(Icons.chevron_left, color: Colors.black));
  }
}

class PopupMenuButtonView extends StatelessWidget {
  const PopupMenuButtonView({Key? key, required this.onPressed})
      : super(key: key);
  final Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        onSelected: (string) {
          onPressed(string.toString());
        },
        icon: const Icon(
          Icons.more_vert_outlined,
          color: Colors.black,
        ),
        itemBuilder: (context) => const [
              PopupMenuItem(
                child: Text(renameShelfText),
                value: renameShelfText,
              ),
              PopupMenuItem(
                child: Text(deleteShelfText),
                value: deleteShelfText,
              )
            ]);
  }
}

class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.onPressed}) : super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          onPressed();
        },
        icon: const Icon(
          Icons.search,
          color: Colors.black,
        ));
  }
}

class DeleteAlertBoxView extends StatelessWidget {
  const DeleteAlertBoxView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Divider(
          color: Colors.black38,
        ),
        Text(
            "This shelf will be deleted from all of your devices. Purchases, samples, uploads and active rentals on this shelf will stay in 'Your books'"),
      ],
    );
  }
}

class ChipShelfSessionView extends StatelessWidget {
  const ChipShelfSessionView({Key? key, required this.chips}) : super(key: key);
  final List<ChipVO> chips;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
            visible: chips[0].isOneSelect || chips.isEmpty,
            child: Container(
              margin: const EdgeInsets.only(
                  left: padding10x, right: padding10x, top: padding10x),
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius30x),
                        side: const BorderSide(color: Colors.black54)))),
                onPressed: () {
                  ShelveBloc shelveBloc = Provider.of(context, listen: false);
                  shelveBloc.close();
                },
                child: const Icon(Icons.close),
              ),
            )),
        Row(
          children: chips
              .map(
                (data) => GestureDetector(
              onTap: () {
                ShelveBloc shelveBloc = Provider.of(context, listen: false);
                shelveBloc.clickChip(data.chipName);
              },
              child: ChipView(
                chipVO: data,
              ),
            ),
          )
              .toList(),
        )
      ],
    );
  }
}

class ChipView extends StatelessWidget {
  const ChipView({Key? key, required this.chipVO}) : super(key: key);
  final ChipVO chipVO;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: padding5x, vertical: padding5x),
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
          left: padding10x, right: padding10x, top: padding10x),
      height: chipHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius30x),
        color: chipVO.isSelect
            ? const Color.fromRGBO(38, 83, 196, 1.0)
            : Colors.white,
        border:
        Border.all(color: chipVO.isSelect ? Colors.white : Colors.black54),
      ),
      child: Text(
        chipVO.chipName,
        style:
        TextStyle(color: chipVO.isSelect ? Colors.white : Colors.black54),
      ),
    );
  }
}
