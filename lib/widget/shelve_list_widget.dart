import 'package:flutter/material.dart';
import 'package:library_app/data/vos/shelve_vo/shelve_vo.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/widget/empty_widget.dart';

class ShelveListWidget extends StatelessWidget {
  const ShelveListWidget({Key? key,required this.shelves,required this.onTap}) : super(key: key);
  final List<ShelveVO> shelves;
  final imageURL =
      'https://www.artyzen.com/wp-content/uploads/2021/12/empty.jpg';
  final emptyImageURL =
      'https://i.giphy.com/media/xTiN0IuPQxRqzxodZm/giphy.webp';
  final Function(ShelveVO)onTap;
  @override
  Widget build(BuildContext context) {
    return   ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Visibility(
            visible: shelves.isEmpty,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: const EmptyWidget(
                text: 'There is no shelves right now. Create one.',
                icon: Icon(
                  Icons.library_add,
                  color: Colors.black38,
                  size: boxConstraintsForImageHeight,
                ),
              ),
            ),
          ),
          Visibility(
              visible: shelves.isNotEmpty,
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: shelves.map((data) {
                  String leadingImage = '';
                  if(data.detailsVO?.isEmpty??true){
                    leadingImage=imageURL;
                  }else{
                    leadingImage=data.detailsVO?.first.image.toString()??emptyImageURL;
                  }
                  String title = data.shelveName.toString();
                  String bookCount = '';
                  if (data.detailsVO?.isEmpty??true) {
                    bookCount = 'Empty';
                  } else {
                    int length = data.detailsVO?.length ?? 0;
                    if (length <= 1) {
                      bookCount = '$length book';
                    } else {
                      bookCount = '$length books';
                    }
                  }
                  return ListTile(
                    onTap: () {
                      onTap(data);
                    },
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius10x),
                      child: Image.network(
                        leadingImage,
                        width: shelveImageHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(title),
                    subtitle: Text(bookCount),
                    trailing: const Icon(Icons.chevron_right,color: Colors.black,),
                  );
                }).toList(),
              ))
        ]);
  }
}
