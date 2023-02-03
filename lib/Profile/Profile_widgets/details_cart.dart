import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:velocity_x/velocity_x.dart';


Widget details_cart(double width, String? count,String? title, onTap){
  return GestureDetector(
    onTap: (){Get.to(onTap);},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(count!),
        Text(title!)
      ],
    ).box.white.rounded.width(width).height(60).padding(EdgeInsets.all(4)).make(),
  );
}