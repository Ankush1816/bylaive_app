import 'package:bylaive/Constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final slidersList = [
      "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg",
      "https://i.postimg.cc/vBjh5tyH/Mobile-login-amico-1.png"
    ];
    return Container(
      padding: EdgeInsets.all(12),
      color: textfieldGrey,
      width: context.width,
      height: context.height,
      child: SafeArea(
          child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            color: lightGrey,
            child: TextFormField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                filled: true,
                fillColor: lightGrey,
                hintText: 'Search',
              ),
            ),
          ),
          VxSwiper.builder(
              itemCount: slidersList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Image.asset(
                    slidersList[index],
                    fit: BoxFit.fill,
                  ),
                );
              })
        ],
      )),
    );
  }
}
