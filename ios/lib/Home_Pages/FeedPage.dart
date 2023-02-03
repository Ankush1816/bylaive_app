import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Home_Pages/CatagoryPage.dart';
import 'package:bylaive/Widgets/HomeButtom.dart';
import 'package:bylaive/Widgets/ProductDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:bylaive/Constants/Strings.dart';
import 'package:bylaive/Constants/Lists.dart';
import '../Services/Fire_services.dart';
import '../Widgets/CatagoryButtom.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(12),
        width: context.width,
        //  height: context.height,
        child: SafeArea(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                // height: 60,
                color: Colors.grey.shade300,
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    filled: true,
                    fillColor:  Colors.grey.shade100,
                    hintText: 'Search',
                  ),
                ),
              ),
              15.heightBox,
              VxSwiper.builder(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  height: 170,
                  itemCount: slidersList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Image.network(
                        slidersList[index],
                        fit: BoxFit.fill,
                      ),
                    );
                  }),
              1.heightBox,
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.heightBox,
                      Text(
                        'Live Sellers',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                            ,
                            color: darkFontGrey),
                      ),
                      4.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            9,
                                (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  cat[index],
                                  width: 130,
                                  height: 130,
                                  fit: BoxFit.contain,
                                ),
                                5.heightBox,
                                Text(
                                  catagorynames[index],
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '\$100',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: primary),
                                ),
                                4.heightBox
                              ],
                            )
                                .box
                                .white
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .roundedSM
                                .make()
                                .onTap(() {}),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    catagories,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(CatagoryPage());
                      },
                      child: Text(
                        "more",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: primary),
                      ))
                ],
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CatagoryButtom(
                          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                          'Women'),
                      CatagoryButtom(
                          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                          'Kids'),
                      CatagoryButtom(
                          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                          'Watches'),
                      CatagoryButtom(
                          'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
                          'Traditional'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      4.heightBox,
                      Text(
                        'Top products',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: darkFontGrey),
                      ),
                      4.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            9,
                            (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  cat[index],
                                  width: 130,
                                  height: 130,
                                  fit: BoxFit.contain,
                                ),
                                5.heightBox,
                                Text(
                                  catagorynames[index],
                                  style: TextStyle(color: Colors.black),
                                ),
                                Text(
                                  '\$100',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: primary),
                                ),
                                4.heightBox
                              ],
                            )
                                .box
                                .white
                                .margin(EdgeInsets.symmetric(horizontal: 4))
                                .roundedSM
                                .make()
                                .onTap(() {}),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('All products',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    StreamBuilder(
                        stream: FirestoreServices.getProducts('Il'),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Container(
                              child:
                              Center(child: CircularProgressIndicator()),
                            );
                          } else if (snapshot.data!.docs.isEmpty) {
                            return Center(
                              child: Text('nothing to show'),
                            );
                          } else {
                            var data = snapshot.data!.docs;
                            return Container(
                             // color: Colors.pink,
                              padding: EdgeInsets.all(10),
                              child: GridView.builder(
                                physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: data.length,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 15,
                                      mainAxisSpacing: 8,
                                      mainAxisExtent: 190),
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Image.network(
                                          data[index]['p_image'][0],
                                          height: 125,
                                          width: 108,
                                        ),
                                        5.heightBox,
                                        Text(data[index]['p_name']),
                                        5.heightBox,
                                        Text(data[index]['p_price']),
                                      ],
                                    )
                                        .box
                                        .color(Colors.white)
                                        .rounded
                                        .clip(Clip.antiAlias)
                                        .outerShadowMd
                                        .make()
                                        .onTap(() {
                                      Get.to(ProductDetails(
                                          title: "${data[index]['p_name']}",
                                          data: data[index]));
                                    });
                                  }),
                            );
                          }
                        },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
