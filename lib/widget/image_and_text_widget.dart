

import 'package:flutter/material.dart';
import 'package:library_app/resources/dimension.dart';

class ImageAndTextWidget extends StatelessWidget {
  const ImageAndTextWidget({Key? key,required this.imageHeight,required this.bookURL,required this.bookName}) : super(key: key);
  final double imageHeight;
  final String bookURL;
  final String bookName;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [

              SizedBox(
                height: imageHeight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(borderRadius10x),
                  child: Image.network(
                    bookURL,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const Center(
                        child: CircularProgressIndicator(
                        ),
                      );
                    },
                  ),
                ),
              ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: padding10x),
                child: IconButton(
                  onPressed: (){

                  },
                  icon: const Icon(Icons.more_horiz,color: Colors.white),
                ),
              ),
            )
            ],
          ),
          const SizedBox(
            height: padding10x,
          ),
          Expanded(
            child: Text(
              bookName,style: const TextStyle(color: Colors.black54,fontSize: fontSize12x),),
          )
        ],
      ),
    );
  }
}
