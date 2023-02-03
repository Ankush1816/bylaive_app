import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/Firebase_consts.dart';

class cartController extends GetxController{
  var cartPrice=0.obs;
  calculate(data){
    for(var i=0;i<data.length;i++){
      cartPrice.value =cartPrice.value+ int.parse(data[i]['tprice'].toString());
    }

  }
}