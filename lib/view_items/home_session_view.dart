import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/resources/strings.dart';

import '../resources/dimension.dart';

class ListTileTextFieldView extends StatelessWidget {
  const ListTileTextFieldView({
    Key? key,
    required this.onTapTextField
  }) : super(key: key);
  final Function onTapTextField;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius10x),
          side: const BorderSide(color: Colors.black38)),
      child:  ListTile(
        onTap: ()=>onTapTextField(),
        leading: const Icon(Icons.search),
        title: const Text(searchPlayBookText),
        trailing: const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Tom_Holland_by_Gage_Skidmore.jpg/1200px-Tom_Holland_by_Gage_Skidmore.jpg'),
        ),
      ),
    );
  }
}

class CarouselSliderView extends StatelessWidget {
  const CarouselSliderView({
    Key? key,
    required this.detailsVO,
    required this.onTap
  }) : super(key: key);
  final List<DetailsVO>detailsVO;
  final Function(DetailsVO)onTap;
  final imageURL='https://i.giphy.com/media/xTiN0IuPQxRqzxodZm/giphy.webp';
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          enableInfiniteScroll: false,
          height: carouselSliderHeight,
          viewportFraction: carouselSliderViewPointFrictionSize,
          autoPlay: true,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: detailsVO.length,
        itemBuilder: (BuildContext context, int index, int pageViewIndex) =>

            Container(
                width: carouselSliderHeight,
              margin: const EdgeInsets.only(
                  bottom: padding20x,),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius10x),
                  boxShadow:  detailsVO.isEmpty?[]:const [
                    BoxShadow(
                        color: Colors.black38,
                        blurRadius: carouselSliderBlurRadius,
                        spreadRadius: 1,
                        offset: Offset(
                            carouselSliderOffSetForX, carouselSliderOffSetForY))
                  ]
                      ),
              child: GestureDetector(
                onTap: (){
                  onTap(detailsVO[index]);
                },
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(borderRadius10x),
                          child: Image.network(detailsVO[index].image??imageURL,fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return const Center(
                                child: CircularProgressIndicator(
                                ),
                              );
                            },
                          )),
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
              )

            )

    );
  }
}

class TitleAndRightIconView extends StatelessWidget {
  TitleAndRightIconView({required this.categoryName,required this.onPressed,required this.hasViewMore});
  final Function(String) onPressed;
  final String categoryName;
  final bool hasViewMore;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          categoryName,
          style: const TextStyle(
              fontSize: fontSize17x, fontWeight: FontWeight.w500),
        ),
        hasViewMore?IconButton(
            onPressed: () {
              onPressed(categoryName);
            },
            icon: const Icon(
              Icons.chevron_right,
              size: rightArrowIconSize,
              color: Colors.black,
            )
        ):Container()
      ],
    );
  }
}

class SortByTextView extends StatelessWidget {
  const SortByTextView({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [const Icon(Icons.sort), Text(text)],
    );
  }
}

