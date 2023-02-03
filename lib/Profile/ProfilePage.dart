import 'dart:convert';

import 'package:bylaive/Authentication/AuthPages.dart';
import 'package:bylaive/Authentication/Authuser.dart';
import 'package:bylaive/Authentication/Userredirect.dart';
import 'package:bylaive/Authentication/login_screen.dart';
import 'package:bylaive/Constants/Strings.dart';
import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Home_Pages/Home_others/Optoions.dart';
import 'package:bylaive/Profile/Profile_widgets/details_cart.dart';
import 'package:bylaive/Seller/Becomeseller.dart';
import 'package:bylaive/Seller/Seller_home.dart';
import 'package:bylaive/Services/Fire_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Controllers/Auth_controller.dart';
import '../Home_Pages/SavedPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Seller/A.dart';
import '../Widgets/ProductDetails.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? email = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // String? email=getUser()?.email;
    return Scaffold(
        body: StreamBuilder(
      stream: FirestoreServices.getUser(email!),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              color: primary,
            ),
          );
        } else {
          var data = snapshot.data!.docs[0];
          return SingleChildScrollView(
            child: Container(
              color: Colors.white,
              child: StreamBuilder<Object>(builder: (context, snapshot) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              // "https://cdn.pixabay.com/photo/2019/08/11/18/59/icon-4399701_960_720.png",
                              "https://media.istockphoto.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=612x612&w=0&k=20&c=yBeyba0hUkh14_jgv1OKqIH0CCSWU_4ckRkAoy2p73o=",
                              width: 140,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                            //     IconButton(onPressed: (){}, icon: Icon(Icons.photo_camera))
                          ],
                        ),
                        4.heightBox,
                        Text("${data['name']}"),
                        Text("${data['email']}"),
                        10.heightBox,
                        Container(
                            child: LayoutBuilder(builder: (context, constraints) {
                          if ("${data['seller']}" == "true") {
                            return Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text('Seller dashboard'),
                              ),
                            ).onTap(() {
                              Get.to(SellerHome());
                            });
                          } else {
                            return Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text('Become seller'),
                              ),
                            ).onTap(() {
                              Get.to(BecomeSeller());
                            });
                          }
                        })),
                        25.heightBox,
                        Container(
                            child: LayoutBuilder(builder: (context, constraints) {
                          if ("${data['seller']}" == "true") {
                            String? id = FirebaseAuth.instance.currentUser?.uid;
                            return Container(
                                child: StreamBuilder(

                                  stream: FirestoreServices.getSellerProducts(id!),
                                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (!snapshot.hasData) {
                                      return Container(
                                        child: const Center(child: CircularProgressIndicator()),
                                      );
                                    } else if (snapshot.data!.docs.isEmpty) {
                                      return const Center(
                                        child: Text('Nothing to show'),
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
                                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                                                  Text(data[index]['p_name'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                                                  5.heightBox,
                                                  Text(data[index]['p_price'],style: TextStyle(color: Colors.black),),
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
                                ),);
                          } else {
                            return Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 60,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.shopping_bag),
                                        15.widthBox,
                                        Center(
                                          child: Text('Orders'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  25.heightBox,
                                  Container(
                                    height: 60,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.payment_sharp),
                                        15.widthBox,
                                        Center(
                                          child: Text('Invoices'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  25.heightBox,
                                  Container(
                                    height: 60,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.home_filled),
                                        15.widthBox,
                                        Center(
                                          child: Text('Address'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  25.heightBox,
                                  Container(
                                    height: 60,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.settings),
                                        15.widthBox,
                                        Center(
                                          child: Text('Settings'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }
                        })),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }
      },
    ));
  }
}
