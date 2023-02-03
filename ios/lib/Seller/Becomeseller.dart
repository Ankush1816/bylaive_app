import 'package:bylaive/Cart/CartScreen.dart';
import 'package:bylaive/Constants/Strings.dart';
import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Seller/Seller_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Checkout/check_out_page.dart';
import '../Controllers/Product_controller.dart';
import '../Home_Pages/HomePage.dart';
import '../Services/Fire_services.dart';

class BecomeSeller extends StatefulWidget {
  const BecomeSeller({Key? key}) : super(key: key);

  @override
  State<BecomeSeller> createState() => _BecomeSellerState();
}

class _BecomeSellerState extends State<BecomeSeller> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _storeName = TextEditingController();
  final TextEditingController _Gst = TextEditingController();
  final TextEditingController _Owner = TextEditingController();
  final TextEditingController _Upi = TextEditingController();
  String? email = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    Get.put(Product_controller());
    var Controller = Get.find<Product_controller>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('            Bylaive',
              style: GoogleFonts.robotoSlab(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25)),
          leading: IconButton(
              onPressed: () {
                Get.back(result: HomeAScreen());
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: StreamBuilder(
          stream: FirestoreServices.getUser(email!),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  color: primary,
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];
              return Container(
                color: Colors.white,
                child: StreamBuilder<Object>(builder: (context, snapshot) {
                  return SafeArea(
                      child: LayoutBuilder(builder: (context, constraints) {
                    if ("${data['seller']}" == "true") {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.network('https://assets10.lottiefiles.com/packages/lf20_abo0cs7z.json',height: 250),
                            Text('You are already a sellor!!'),
                            ElevatedButton(
                                onPressed: () {
                                  Get.to(SellerHome());
                                },
                                child: Text('Go to seller dashboard'))
                          ],
                        ),
                      );
                    } else {
                      bool? checkedValue=false
                      ;
                      return SafeArea(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Center(
                                  child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 15.0, left: 15, top: 30, bottom: 0),
                                child: Column(
                                  children: [
                                    Image.network(
                                      'https://awesomecontentcreator.com/wp-content/uploads/2019/04/success-selling-vector-illustrations.jpg',
                                      width: 250,
                                    ),
                                    50.heightBox,
                                    TextField(style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 239, 239, 239),
                                                width: 1.5),),
                                        fillColor:
                                            Color.fromARGB(255, 239, 239, 239),
                                        filled: true,
                                        icon: Icon(Icons.store,color: Colors.grey,),
                                        hintText: 'Store name',
                                        //   helperText: 'Helper Text',
                                        //  counterText: '0 characters',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                      ),
                                      controller: _storeName,
                                    ),
                                    25.heightBox,
                                    TextField(style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 239, 239, 239),
                                                width: 1.5)),
                                        fillColor:
                                            Color.fromARGB(255, 239, 239, 239),
                                        filled: true,
                                        icon: Icon(Icons.numbers,color: Colors.grey,),
                                        hintText: 'Gst number',
                                        //   helperText: 'Helper Text',
                                        //  counterText: '0 characters',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFCAF3B)),
                                        ),
                                      ),
                                      controller: _Gst,
                                    ),
                                    25.heightBox,
                                    TextField(style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 239, 239, 239),
                                                width: 1.5)),
                                        fillColor:
                                            Color.fromARGB(255, 239, 239, 239),
                                        filled: true,
                                        icon: Icon(Icons.person_pin,color: Colors.grey,),
                                        hintText: 'Owner',
                                        //   helperText: 'Helper Text',
                                        //  counterText: '0 characters',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFCAF3B)),
                                        ),
                                      ),
                                      controller: _Owner,
                                    ),
                                    25.heightBox,
                                    TextField(style: TextStyle(color: Colors.black),
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 239, 239, 239),
                                                width: 1.5)),
                                        fillColor:
                                            Color.fromARGB(255, 239, 239, 239),
                                        filled: true,
                                        icon: Icon(Icons.currency_rupee,color: Colors.grey,),
                                        hintText: 'Upi id',
                                        //   helperText: 'Helper Text',
                                        //  counterText: '0 characters',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide(
                                              color: Color(0xFFFCAF3B)),
                                        ),
                                      ),
                                      controller: _Upi,
                                    ),
                                    25.heightBox,

                                    CheckboxListTile(
                                      title: TextButton(
                                          onPressed: () {}, child: TextButton(onPressed: (){}, child: Text('Please accept our Terms&conditions',style: TextStyle(color: Colors.black),))),
                                      value: checkedValue=true,
                                      onChanged: (newValue) {
                                        setState(() {
                                          checkedValue = newValue;
                                        });
                                      },
                                      controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                                    ),
                                    ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: primary),
                                        onPressed: () {
                                          Controller.AddSeller(
                                              StoreName: _storeName.text,
                                              Gst: _Gst.text,
                                              Owner: _Owner.text,
                                              Upi: _Upi.text);
                                        },
                                        child: Text("Submit"))
                                  ],
                                ),
                              )),
                            ],
                          ),
                        ),
                      );
                    }
                  }));
                }),
              );
            }
          },
        ));
  }
}
