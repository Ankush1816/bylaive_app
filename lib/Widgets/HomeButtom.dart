import 'package:bylaive/Constants/colours.dart';
import 'package:flutter/material.dart';

class HomeButtom extends StatelessWidget {
  final Color Textcolor;
  final Color BackgroundColor;
  final Color Iconcolor;
  double Iconsize;
  final String text;
  final IconData icon;
  double height;
  double width;

  final VoidCallback? ontap;

  HomeButtom({
    Key? key,
    required this.Textcolor,
    required this.BackgroundColor,
    required this.text,
    required this.icon,
    required this.height,
    required this.width,
    required this.Iconsize,
    this.ontap, required this.Iconcolor,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(


          width: width,
          height: height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,color: Iconcolor,size: Iconsize,),
                Text(text,style: TextStyle(color: Textcolor),),
              ],
            ),
          ),
          decoration: BoxDecoration(
            color: BackgroundColor,
            borderRadius: BorderRadius.circular(10),

            boxShadow: [
              BoxShadow(
                color: secondary,
                offset: const Offset(
                  2.0,
                  2.0,
                ),
                blurRadius: 2.0,
                spreadRadius: 3.0,
              ), //BoxShadow
              BoxShadow(
                color: secondary,
                offset: const Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 2.0,
              ), //BoxShadow
            ],
          ),

        ),
      ),
    );
  }
}
