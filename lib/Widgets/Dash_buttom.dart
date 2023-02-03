import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/colours.dart';

Widget dashbuttom(context,{title,count,image,onTap}){
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                image,
                width: 70,
              ),
            ),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      10.heightBox,
                      Text(title,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                      10.heightBox,
                      Text(count,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),)

                    ],
                  ),
                )),

          ],
        ).box.color(secondary).rounded.size(180, 100).make(),
      ],
    ),
  );
}