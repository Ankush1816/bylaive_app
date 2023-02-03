import 'package:bylaive/Constants/Lists.dart';
import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Widgets/ProductDetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../Services/Fire_services.dart';

class CatagoryDetails extends StatelessWidget {
  final String? title;
  final dynamic data;


  const CatagoryDetails({Key? key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation:0,backgroundColor: primary),
      body: StreamBuilder(
          stream: FirestoreServices.getProducts(title),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
              return Container(child: Center(child: CircularProgressIndicator()),);

            }
            else if(snapshot.data!.docs.isEmpty){
              return Center(child: Text('nothing to show'),);
            }
            else{
              var data=snapshot.data!.docs;
              return Container(
                padding: EdgeInsets.all(20),
                child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
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
                        Get.to(ProductDetails(title: "${data[index]['p_name']}",data:data[index]));
                      });
                    }),
              );
            }

          }
      ),
    );
  }
}
