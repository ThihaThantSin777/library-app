import 'package:flutter/material.dart';
import 'package:library_app/bloc/library_bloc.dart';
import 'package:library_app/bloc/shelves_bloc.dart';
import 'package:library_app/data/vos/details_vo/details_vo.dart';
import 'package:library_app/resources/dimension.dart';
import 'package:library_app/resources/strings.dart';
import 'package:provider/provider.dart';

class SortBottomSheetView extends StatelessWidget {
  const SortBottomSheetView({Key? key,required this.sortText,required this.isShelf}) : super(key: key);
  final String sortText;
  final bool isShelf;
  @override
  Widget build(BuildContext context) {
    LibraryBloc libraryBloc=Provider.of(context,listen:false);
    ShelveBloc shelveBloc=Provider.of(context,listen:false);
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Padding(
            padding:  EdgeInsets.symmetric(horizontal: padding10x,vertical: padding10x),
            child: Text('Sort by',style: TextStyle(fontWeight: FontWeight.w600,fontSize: fontSize19x),),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Radio(
              key: const Key(sortByRecentText),
              value: sortByRecentText,
              groupValue: sortText,
              onChanged: (value){
                if(isShelf){
                  shelveBloc.sortText(value.toString());
                  libraryBloc.setSortText=value.toString();
                }else{
                  libraryBloc.sortText(value.toString());
                }
                Navigator.of(context).pop();
              },
            ),
            title: const Text('Recent'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Radio(
              key: const Key(sortByTitleText),
              value: sortByTitleText,
              groupValue: sortText,
              onChanged: (value){
                if(isShelf){
                  shelveBloc.sortText(value.toString());
                  libraryBloc.setSortText=value.toString();
                }else{
                  libraryBloc.sortText(value.toString());
                }
                Navigator.of(context).pop();
              },
            ),
            title: const Text('Title'),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Radio(
              key: const Key(sortByAuthorText),
              value: sortByAuthorText,
              groupValue: sortText,
              onChanged: (value){
                if(isShelf){
                  shelveBloc.sortText(value.toString());
                  libraryBloc.setSortText=value.toString();
                }else{
                  libraryBloc.sortText(value.toString());
                }
                Navigator.of(context).pop();
              },
            ),
            title: const Text('Author'),
          ),
        ],
      ),
    );
  }
}


class PresentBottomSheetView extends StatelessWidget {
  const PresentBottomSheetView({Key? key,required this.presentText}) : super(key: key);
  final String presentText;
  @override
  Widget build(BuildContext context) {
    LibraryBloc libraryBloc=Provider.of(context,listen:false);
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: padding10x,vertical: padding10x),
            child: Text('Present',style: TextStyle(fontWeight: FontWeight.w600,fontSize: fontSize19x),),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Radio(
              key: const Key(presentListText),
              value: presentListText,
              groupValue: presentText,
              onChanged: (value){
                libraryBloc.presentText(value.toString());
                Navigator.of(context).pop();
              },
            ),
            title: const Text(presentListText),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Radio(
              key: const Key(presentGridText),
              value: presentGridText,
              groupValue: presentText,
              onChanged: (value){
                libraryBloc.presentText(value.toString());
                Navigator.of(context).pop();
              },
            ),
            title: const Text(presentGridText),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Radio(
              key: const Key(presentLargeGridText),
              value: presentLargeGridText,
              groupValue: presentText,
              onChanged: (value){
                libraryBloc.presentText(value.toString());
                Navigator.of(context).pop();
              },
            ),
            title: const Text(presentLargeGridText),
          ),
        ],
      ),
    );
  }
}

class GridBookView extends StatelessWidget {
    const GridBookView({Key? key,required this.detailsVO,required this.isLargeGrid,required this.height,required this.onTap,required this.onPressed}) : super(key: key);
  final List<DetailsVO>detailsVO;
  final bool isLargeGrid;
  final double height;
  final Function(DetailsVO)onTap;
  final Function(DetailsVO) onPressed;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isLargeGrid?2:3,
          crossAxisSpacing: padding10x,
          childAspectRatio: childAspectRation
        ),
        itemCount: detailsVO.length,
        itemBuilder: (_,index){
         return  GestureDetector(
           onTap: (){
             DetailsVO details=detailsVO[index];
             details.category='Action';
             onTap(details);
           },
           child:
           Stack(
             children: [
               Positioned.fill(
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisSize: MainAxisSize.min,
                   children: [
                     Expanded(
                       flex: 4,
                       child: Stack(
                         children: [
                           SizedBox(
                             height: height,
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(borderRadius10x),
                               child: Image.network(
                                 detailsVO[index].image.toString(),
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
                           )
                         ],
                       ),
                     ),
                     const SizedBox(
                       height: padding10x,
                     ),
                     Expanded(
                       child: Text(
                         detailsVO[index].title.toString(),style: const TextStyle(color: Colors.black54,fontSize: fontSize12x),),
                     )
                   ],
                 ),
               ),
               Align(
                 alignment: Alignment.topRight,
                 child: Padding(
                   padding:  EdgeInsets.only(right: isLargeGrid?padding30x:padding20x),
                   child: IconButton(
                     key: Key(detailsVO[index].title.toString()),
                     onPressed: (){
                    onPressed(detailsVO[index]);
                     },
                     icon: const Icon(Icons.more_horiz,color: Colors.white),
                   ),
                 ),
               )
             ],
           ),
         );
        }
    );
  }
}

class ListTileBooksView extends StatelessWidget {
  const ListTileBooksView({Key? key,required this.detailsVO,required this.onTap,required this.onPressed}) : super(key: key);
  final List<DetailsVO>detailsVO;
  final Function(DetailsVO)onTap;
  final Function(DetailsVO) onPressed;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: detailsVO.length,
        itemBuilder:(_,index)=>ListTile(
          onTap: () {
            DetailsVO details=detailsVO[index];
            details.category='Action';
            onTap(details);
          },
          minVerticalPadding: padding10x,
          contentPadding: const EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius10x),
              child: SizedBox(
                width: imageWidth,
                  child: Image.network(detailsVO[index].image.toString(),fit: BoxFit.fill,))),
          title: Text(detailsVO[index].title.toString()),
          subtitle: Text(detailsVO[index].bookType.toString()),
          trailing: Wrap(

            children:  [
            const  Icon(Icons.download_done_outlined),
            const  SizedBox(
                width: padding50x,
              ),
             IconButton(onPressed: (){

               onPressed(detailsVO[index]);
             }, icon: const Icon(Icons.more_horiz))
            ],
          ),
        )
    );
  }
}


