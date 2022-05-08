import 'package:flutter/material.dart';
import 'package:library_app/bloc/details_bloc.dart';
import 'package:library_app/bloc/search_temp_bloc.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/data/vos/search_vo/items_vo.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/view_items/details_session_view.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key,}) : super(key: key);
  final imageURL='https://i.giphy.com/media/xTiN0IuPQxRqzxodZm/giphy.webp';
  void navigateBack(context) {
    Navigator.of(context).pop();
  }

  void navigateToDetailsView(ItemsVO itemsVO, context) {
    SearchTempBloc searchTempBloc=Provider.of(context,listen: false);
    searchTempBloc.saveItemVOObjectInDetailsDatabase(itemsVO);
    Navigator.of(context).push(
        MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider<DetailsBloc>(
          create: (context)=> DetailsBloc(itemsVO.volumeInfo?.title.toString()??''),
            child: const DetailsPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            navigateBack(context);
          },
          icon: const Icon(Icons.chevron_left, color: Colors.black,),
        ),
        actions: const[
          Icon(Icons.search, color: Colors.black,),
          SizedBox(
            width: padding20x,
          ),
          Icon(Icons.book, color: Colors.black,),
          SizedBox(
            width: padding20x,
          ),
          Icon(Icons.more_vert_outlined, color: Colors.black,),
           SizedBox(
             width: padding20x,
          ),
        ],
      ),
      body:
      Selector<DetailsBloc, DetailsVO?>(
          selector: (_, bloc) => bloc.getDetailsVO,
          builder: (_, detailsVO, child) =>
          detailsVO == null
              ? const Center(child: CircularProgressIndicator(),)
              : ListView(
            children: [
              DetailsImageAndTitleView(
                title: detailsVO.title.toString(),
                imageURL:detailsVO.image??imageURL,
                author: detailsVO.author.toString(),
              ),
              const SizedBox(
                height: padding20x,
              ),
              DetailsIconBookTypePageCountView(
                bookType: detailsVO.bookType.toString(),
                pageCount: detailsVO.pages.toString(),
                ratingCount: detailsVO.rating.toString(),
                reviewCount: detailsVO.reviewCount.toString(),
                price: detailsVO.price.toString(),
              ),

              DetailsAboutTheBookView(
                description: detailsVO.description.toString(),
                title: 'About the book',
              ),
              const SizedBox(
                height: padding20x,
              ),
              const RatingAndCommentView(),
             const DetailsAboutTheBookView(
                description: 'A people is any plurality of persons considered as a whole. Used in politics and law it is a term to refer to the collective or community of an ethnic.',
                title: 'About the book',
              ),
              SimilarBookView(
                onPressed: (itemVO){
                  navigateToDetailsView(itemVO, context);
                },
              ),
              const ReviewAndPolicyView(),
            ],
          ),
          )
      );

  }
}
