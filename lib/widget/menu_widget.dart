
import 'package:flutter/material.dart';
import 'package:library_app/data/vos/menu_vo/menu_vo.dart';
import 'package:library_app/pages/add_to_shelf_page.dart';
import 'package:library_app/resources/dimension.dart';

class MenuWidget extends StatelessWidget {
  MenuWidget({required this.imageURL,required this.imageTitle,required this.imageType, this.isForShelf=false,required this.onTap});
  final String imageURL;
  final String imageTitle;
  final String imageType;
  final bool isForShelf;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.37,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius10x),
              child: Image.network(imageURL),
            ),
            title: Text(imageTitle),
            subtitle: Text(imageType),
          ),
          const Divider(
            color: Colors.black38,
          ),
          const SizedBox(
            height: padding10x,
          ),
          ...buildBody(isForShelf,context),
          const SizedBox(
            height: padding10x,
          ),
        ],
      ),
    );
  }
  List<Widget> buildBody(bool isForShelf,context)=>isForShelf? menuListShelf.map((data) =>
      ListTile(
        onTap: (){
          if(data.title=='Remove from shelf'){

          }
        },
    leading: data.icon,
    title: Text(data.title),
  )).toList():menuList.map((data) =>
      ListTile(
        onTap: (){
          if(data.title=='Add to shelf'){
           onTap();
          }
        },
        leading: data.icon,
        title: Text(data.title),
      )).toList();
}
