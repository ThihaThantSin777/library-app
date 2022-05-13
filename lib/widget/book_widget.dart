import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/resources/dimension.dart';

class BookWidget extends StatelessWidget {
  const BookWidget(
      {Key? key,
      required this.width,
      this.height = 0,
      required this.bookURL,
        required this.bookName,
        required this.imageHeight,
        required this.onPressed,
      })
      : super(key: key);
  final double width;
  final double height;
  final String bookURL;
  final String bookName;
  final double imageHeight;
  final Function onPressed;
 // void showMenu(context){
 //  showModalBottomSheet(context: context, builder: (context){
 //    return MenuWidget(imageURL: bookURL, imageTitle: bookName, imageType: 'E Book');
 //  });
 //  }
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
      onPressed: ()=>onPressed(),
    ),
    );
  }
}



class ImageAndTextWidget extends StatelessWidget {
  const ImageAndTextWidget({Key? key,required this.imageHeight,required this.bookURL,required this.bookName,required this.onPressed}) : super(key: key);
  final double imageHeight;
  final String bookURL;
  final String bookName;
  final Function onPressed;
  final imageURL='https://i.giphy.com/media/xTiN0IuPQxRqzxodZm/giphy.webp';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [

            SizedBox(
              height: imageHeight,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius10x),
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: bookURL.isEmpty?imageURL:bookURL,
                    placeholder:(context,url)=>const   Center(
                      child: CircularProgressIndicator(
                      ),
                    ),
                    errorWidget: (context,url,error){
                      return Image.network(imageURL);
                    }
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(right: padding10x),
                child: IconButton(
                  onPressed: (){
                      onPressed();
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
    );
  }
}

