import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/widget/book_widget.dart';
import 'package:library_app/widget/horizontal_list_view_and_title_widget.dart';
import 'package:provider/provider.dart';

class DetailsImageAndTitleView extends StatelessWidget {
  const DetailsImageAndTitleView(
      {Key? key,
      required this.imageURL,
      required this.title,
      required this.author})
      : super(key: key);
  final String imageURL;
  final String title;
  final String author;
  final imageError='https://i.giphy.com/media/xTiN0IuPQxRqzxodZm/giphy.webp';
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: padding10x, vertical: padding10x),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius10x),
            child: CachedNetworkImage(
              imageUrl:imageURL,
              width: bookWidth,
              height: carouselSliderHeight,
              fit: BoxFit.cover,
              placeholder:(context,url)=>const   Center(
                child: CircularProgressIndicator(
                ),
              ),
              errorWidget: (context,url,error)=>Image.network(imageError),
            ),
          ),
          const SizedBox(
            width: padding10x,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxWidth: boxConstraintsForImageWidth,
                        maxHeight: boxConstraintsForImageHeight),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: fontSize19x, fontWeight: FontWeight.w600),
                    )),
                ConstrainedBox(
                    constraints: const BoxConstraints(
                        maxWidth: boxConstraintsForImageWidth + 20,
                        maxHeight: boxConstraintsForImageWidth),
                    child: Text(
                      author,
                      style: const TextStyle(
                          color: Colors.black54, fontSize: fontSize17x),
                    )),
              ])
        ],
      ),
    );
  }
}

class DetailsIconBookTypePageCountView extends StatelessWidget {
  const DetailsIconBookTypePageCountView(
      {Key? key,
      required this.bookType,
      required this.pageCount,
      required this.ratingCount,
      required this.reviewCount,
      required this.price})
      : super(key: key);
  final String ratingCount;
  final String bookType;
  final String pageCount;
  final String reviewCount;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: padding10x, vertical: padding10x),
      height: MediaQuery.of(context).size.height * 0.175,
      child: Column(
        children: [
          IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      '$ratingCount ★',
                      style: const TextStyle(
                          fontSize: fontSize19x, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      '$reviewCount reviews',
                      style: const TextStyle(
                          fontSize: fontSize17x, color: Colors.black54),
                    )
                  ],
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Column(
                  children: [
                    const Icon(
                      Icons.book,
                      color: Colors.black,
                      size: fontSize25x,
                    ),
                    Text(
                      bookType,
                      style: const TextStyle(
                          fontSize: fontSize17x, color: Colors.black54),
                    )
                  ],
                ),
                const VerticalDivider(
                  color: Colors.black,
                ),
                Column(
                  children: [
                    Text(
                      pageCount,
                      style: const TextStyle(
                          fontSize: fontSize19x, fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      ' pages',
                      style: TextStyle(
                          fontSize: fontSize17x, color: Colors.black54),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: padding20x,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: padding40x,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius10x),
                    border: Border.all(color: Colors.black54)),
                child: const Center(
                  child: Text(
                    'Free Sample',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(
                width: padding10x,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.45,
                height: padding40x,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(borderRadius10x),
                ),
                child: Center(
                  child: Text(
                    '\$ $price',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: padding20x,
          ),
          const Divider(
            color: Colors.black54,
          )
        ],
      ),
    );
  }
}

class DetailsAboutTheBookView extends StatelessWidget {
  const DetailsAboutTheBookView(
      {Key? key, required this.description, required this.title})
      : super(key: key);
  final String description;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: padding10x, vertical: padding10x),
      height: MediaQuery.of(context).size.height * 0.15,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                    fontSize: fontSize17x, fontWeight: FontWeight.w600),
              ),
              const Icon(Icons.chevron_right, color: Colors.blue)
            ],
          ),
          const SizedBox(
            height: padding20x,
          ),
          Expanded(
            child: Text(
              description,
              overflow: TextOverflow.fade,
              style: const TextStyle(fontSize: fontSize17x),
            ),
          )
        ],
      ),
    );
  }
}

class RatingAndCommentView extends StatelessWidget {
  const RatingAndCommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: padding10x, vertical: padding10x),
      height: MediaQuery.of(context).size.height * 0.73,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Rating and review',
                style: TextStyle(
                    fontSize: fontSize17x, fontWeight: FontWeight.w600),
              ),
              Icon(Icons.chevron_right, color: Colors.blue)
            ],
          ),
          const SizedBox(
            height: padding10x,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: const [
                  Text(
                    '4.5',
                    style: TextStyle(
                        fontSize: fontSize35x, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: padding10x,
                  ),
                  Text('★★★★★'),
                  SizedBox(
                    height: padding10x,
                  ),
                  Text(
                    '69 total',
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              ),
              Column(
                children: const [
                  ProgressBarView(
                    leftWidth: 200,
                    rightWidth: 100,
                  ),
                  ProgressBarView(
                    leftWidth: 130,
                    rightWidth: 170,
                  ),
                  ProgressBarView(
                    leftWidth: 130,
                    rightWidth: 170,
                  ),
                  ProgressBarView(
                    leftWidth: 130,
                    rightWidth: 170,
                  ),
                  ProgressBarView(
                    leftWidth: 130,
                    rightWidth: 170,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: padding10x,
          ),
          const CommentView(),
          const SizedBox(
            height: padding10x,
          ),
          const CommentView(),
        ],
      ),
    );
  }
}

class CommentView extends StatelessWidget {
  const CommentView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Tom_Holland_by_Gage_Skidmore.jpg/1200px-Tom_Holland_by_Gage_Skidmore.jpg'),
        ),
        const SizedBox(
          width: padding10x,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Steve',
              style:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: fontSize17x),
            ),
            const Text(
              '★★★★★ Jul 16, 2020',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: fontSize15x,
                  color: Colors.black54),
            ),
            const SizedBox(
              height: padding10x,
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 350, maxHeight: 300),
              child: const Text(
                'You should only submit an answer when you are proposing a solution to the poster\'s problem. If you want the poster to clarify the question or provide more information, please leave a comment instead, requesting additional details. When answering, please include specifics, such as step-by-step instructions, context for the solution, and links to useful resources. Also, please make sure that you answer complies with our Rules of Engagement',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize15x,
                    color: Colors.black54),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class ProgressBarView extends StatelessWidget {
  const ProgressBarView({
    Key? key,
    required this.leftWidth,
    required this.rightWidth,
  }) : super(key: key);
  final double leftWidth;
  final double rightWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: padding10x),
          width: leftWidth,
          height: leftAndHeight,
          decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius10x),
                bottomLeft: Radius.circular(borderRadius10x),
              )),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: padding10x),
          width: rightWidth,
          height: leftAndHeight,
          decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(borderRadius10x),
                bottomRight: Radius.circular(borderRadius10x),
              )),
        )
      ],
    );
  }
}

class SimilarBookView extends StatelessWidget {
  const SimilarBookView({Key? key, required this.onPressed}) : super(key: key);
  final Function(ItemsVO) onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Selector<DetailsBloc, List<ItemsVO>?>(
          selector: (_, bloc) => bloc.getSimilarBook,
          builder: (_, similarBooks, child) => similarBooks == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : HorizontalListViewAndTitleWidget(
                  onTap: (text)=>debugPrint('None'),
                  keyText: '',
                  key: UniqueKey(),
                  itemCount: similarBooks.length,
                  itemBuilder: (_, index) => GestureDetector(
                    onTap: () {
                      onPressed(similarBooks[index]);
                    },
                    child: BookWidget(
                      onPressed: (){
                        print(similarBooks[index]);
                      },
                      imageHeight: imageHeight,
                      width: bookWidth,
                      bookURL: similarBooks[index]
                              .volumeInfo
                              ?.imageLinks
                              ?.thumbnail
                              .toString() ??
                          '',
                      bookName:
                          similarBooks[index].volumeInfo?.title?.toString() ??
                              '',
                    ),
                  ),
                  hasViewMore: false,
                  onPressed: (text) {},
                  categoryName: 'Similar Books',
                ),
        ));
  }
}

class ReviewAndPolicyView extends StatelessWidget {
  const ReviewAndPolicyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: padding10x, vertical: padding10x),
      height: MediaQuery.of(context).size.height * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Rate this book',
            style:
                TextStyle(fontSize: fontSize17x, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: padding10x,
          ),
          const Text(
            'Tell everyone what you think',
            style: TextStyle(fontSize: fontSize15x, color: Colors.black54),
          ),
          const SizedBox(
            height: padding10x,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text(
                '☆',
                style: TextStyle(fontSize: fontSize35x),
              ),
              Text(
                '☆',
                style: TextStyle(fontSize: fontSize35x),
              ),
              Text(
                '☆',
                style: TextStyle(fontSize: fontSize35x),
              ),
              Text(
                '☆',
                style: TextStyle(fontSize: fontSize35x),
              ),
              Text(
                '☆',
                style: TextStyle(fontSize: fontSize35x),
              ),
            ],
          ),
          const SizedBox(
            height: padding10x,
          ),
          Center(
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: BorderRadius.circular(borderRadius5x)),
              child: const Center(
                child: Text('Write a review'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
