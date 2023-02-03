import 'package:bylaive/Constants/colours.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/Strings.dart';
import '../Services/Fire_services.dart';
import '../Widgets/ProductDetails.dart';

class SellerProducts extends StatefulWidget {
  const SellerProducts({Key? key}) : super(key: key);

  @override
  State<SellerProducts> createState() => _SellerProductsState();
}

class _SellerProductsState extends State<SellerProducts> {
  @override
  Widget build(BuildContext context) {
    String? id = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text('Your products'),
      ),
      body: StreamBuilder(
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
      ),
    );
  }
}
