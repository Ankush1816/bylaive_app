import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget productImage({required label,onpress}){
  //return '$label'.text.bold.makeCentered().box.color(Colors.grey.withOpacity(0.2)).roundedSM.size(100, 100).make();
  return GestureDetector(
    onTap: onpress,
    child: Container(
      width: 100,
      height: 100,
      child: Center(child: Text('$label')),
    ).box.color(Colors.grey.withOpacity(0.2)).roundedSM.size(100, 100).make(),
  );
}