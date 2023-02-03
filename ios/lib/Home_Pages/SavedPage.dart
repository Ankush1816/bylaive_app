import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Services/Fire_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Controllers/CartController.dart';
import '../Widgets/ProductDetails.dart';

class SavedPage extends StatefulWidget {
  final String? title;
  final dynamic data;
  const SavedPage({Key? key, this.title, this.data}) : super(key: key);

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  @override
  Widget build(BuildContext context) {
    String? id = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
      body: StreamBuilder(
          stream: FirestoreServices.getLiked(id!),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
              return Container(child: Center(child: CircularProgressIndicator()),);

            }
            else if(snapshot.data!.docs.isNotEmpty){
              var data=snapshot.data!.docs;
              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(top:15),
                      child: Container(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context,int index){
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListTile(
                                  leading: Image.network("${data[index]['img']}"),
                                  title: "${data[index]['title']}".text.make(),
                                  subtitle: "${data[index]['tprice']}".numCurrency.text.color(primary).make(),
                                ).box
                                    .color(Colors.white)
                                    .rounded
                                    .clip(Clip.antiAlias)
                                    .outerShadowMd
                                    .make().onTap(() {  Get.to(ProductDetails(title: "${data[index]['p_name']}",data:data[index]));}),
                              );

                            }),
                      ),
                    )),

                  ],
                ),
              );
            }
            else{

              return Container(
                color: Colors.white,
                child: Center(child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTP6MZoAoJUg5xp1rjEDpwYfp9HDDgfvADE-b-HGNWvPzeql2n3Pv680WpImLjxy_qY024&usqp=CAU')),
              );
            }

          }
      ),
    );
  }
}
