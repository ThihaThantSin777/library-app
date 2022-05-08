import 'package:flutter/material.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/widget/image_and_text_widget.dart';

class BookWidget extends StatelessWidget {
  const BookWidget(
      {Key? key,
      required this.width,
      this.height = 0,
      required this.bookURL,
        required this.bookName,
        required this.imageHeight
      })
      : super(key: key);
  final double width;
  final double height;
  final String bookURL;
  final String bookName;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return
      Container(
      width: width,
      margin: const EdgeInsets.only(
          left: padding10x),

      child:
    ImageAndTextWidget(
      imageHeight: imageHeight,
      bookName: bookName,
      bookURL: bookURL,
    ),
    );
  }
}
