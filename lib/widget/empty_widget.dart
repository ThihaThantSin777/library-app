import 'package:flutter/material.dart';
import 'package:library_app/resources/dimension.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({Key? key,required this.text,required this.icon}) : super(key: key);
  final String text;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child:   Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
         const SizedBox(
            height: padding10x,
          ),
          Text(text,style: const TextStyle(color: Colors.black38),),
        ],
      ),
    );
  }
}
