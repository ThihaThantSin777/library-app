
import 'package:flutter/material.dart';
import 'package:library_app/data/vos/view_more_vo/view_more_vo.dart';
import 'package:library_app/resources/dimension.dart';

class ViewMoreGridView extends StatelessWidget {
  const ViewMoreGridView({
    Key? key,
    required this.viewMoreList,
    required this.scrollController,
    required this.onTap,
    required this.onPressed
  }) : super(key: key);
  final List<ViewMoreVO>viewMoreList;
  final ScrollController scrollController;
  final Function(ViewMoreVO)onTap;
  final Function(ViewMoreVO) onPressed;
  final imageURL='https://i.giphy.com/media/xTiN0IuPQxRqzxodZm/giphy.webp';
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
        gridDelegate:
         const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCountForViewMorePage,
            childAspectRatio: childAspectRationForViewMorePage,
            mainAxisSpacing: padding10x,
            crossAxisSpacing: padding20x),
        itemCount: viewMoreList.length,
        itemBuilder: (_, index) =>
                GestureDetector(
                  onTap: (){
                    ViewMoreVO viewMoreVO=ViewMoreVO.normal();
                    String image=viewMoreList[index].imageURL??imageURL;
                    viewMoreVO.imageURL=image;
                    onTap(viewMoreList[index]);
                  },
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            viewMoreList[index].imageURL??imageURL,
                            height: carouselSliderHeight,
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
                          const SizedBox(
                            height: padding10x,
                          ),
                          Text(viewMoreList[index].bookDetails?[0].title??'',style:const TextStyle(color: Colors.black54))
                        ],
              ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(right: padding20x),
                          child: IconButton(
                            onPressed: (){
                              ViewMoreVO viewMoreVO=ViewMoreVO.normal();
                              String image=viewMoreList[index].imageURL??imageURL;
                              viewMoreVO.imageURL=image;
                onPressed(viewMoreVO);
                            },
                            icon: const Icon(Icons.more_horiz,color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                )

    );
  }
}
