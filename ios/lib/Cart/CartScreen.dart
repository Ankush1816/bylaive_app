import 'package:bylaive/Checkout/payment_page.dart';
import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Services/Fire_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';
import '../Checkout/check_out_page.dart';
import '../Controllers/CartController.dart';
import '../Widgets/ProductDetails.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Controller=Get.put(cartController());
    String? id = FirebaseAuth.instance.currentUser?.uid;
    return Scaffold(
      appBar: AppBar(backgroundColor: primary),
      body: StreamBuilder(
          stream: FirestoreServices.getCart(id!),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if(!snapshot.hasData){
              return Container(child: Center(child: CircularProgressIndicator()),);

            }
            else if(snapshot.data!.docs.isNotEmpty){
              var data=snapshot.data!.docs;
              Controller.calculate(data);
              return Container(
                child: Column(
                  children: [
                    Expanded(child: Padding(
                      padding: const EdgeInsets.only(top: 25,left: 5,right: 12),
                      child: Container(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context,int index){
                              return ListTile(
                                leading: Image.network("${data[index]['img']}"),
                                title: "${data[index]['title']} x ${data[index]['qty']}".text.make(),
                                subtitle: "${data[index]['tprice']}".numCurrency.text.color(primary).make(),
                                trailing: Icon(Icons.delete, color: secondary,).onTap(() {FirestoreServices.deleteDoc(data[index].id);
                                }),
                              );

                            }),
                      ),
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total price:-'),
                     Obx(() => "${Controller.cartPrice.value}".text.make()),
                      ],
                    ).box.padding(EdgeInsets.all(12)).roundedSM.color(primary).make(),
                    10.heightBox,
                    SizedBox(
                      width: context.screenWidth-80,
                      child: ElevatedButton(onPressed: (){Get.to(CheckOutPage());}, child: Text('Proceed to checkout')),
                    )
                  ],
                ),
              );
            }
            else{

             return Container(child: Text('a'),);
            }

          }
      ),
    );
  }
}
