import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget CatagoryButtom(String image, String catagory){
  return Row(
    children: [
      Image.network(image,width: 60,fit: BoxFit.fill,),
      10.widthBox,
      Text(catagory)

    ],
  ).box.width(150).margin(EdgeInsets.all(4)).white.padding(EdgeInsets.all(4)).roundedSM.outerShadow.make();

}