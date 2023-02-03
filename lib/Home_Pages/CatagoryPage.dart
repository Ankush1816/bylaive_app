import 'package:bylaive/Constants/Lists.dart';
import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Home_Pages/Home_others/CatagoryDetails.dart';
import 'package:bylaive/Services/Fire_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class CatagoryPage extends StatefulWidget {
  const CatagoryPage({Key? key}) : super(key: key);

  @override
  State<CatagoryPage> createState() => _CatagoryPageState();
}

class _CatagoryPageState extends State<CatagoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation:0,backgroundColor: primary,),
      body: StreamBuilder(
        stream: FirestoreServices.getProducts('Women'),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData){
            return Container(child: CircularProgressIndicator(),);

          }else{
            return Container(
              padding: EdgeInsets.all(12),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 150),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.network(
                          cat[index],
                          height: 120,
                          width: 108,
                        ),
                        Text(catagorynames[index])
                      ],
                    )
                        .box
                        .color(primary)
                        .rounded
                        .clip(Clip.antiAlias)
                        .outerShadowMd
                        .make()
                        .onTap(() {
                      Get.to(CatagoryDetails(title: catagorynames[index],));
                    });
                  }),
            );
          }

        }
      ),
    );
  }
}
