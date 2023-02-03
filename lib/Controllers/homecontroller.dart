import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends  GetxController{
  @override
  void onInit() {
    getUsername();
    // TODO: implement onInit
    super.onInit();
  }
  var currentnavIndex=0.obs;
  var username='';
  getUsername() async {
  var n=  await FirebaseFirestore.instance.collection('Users').where('id',isEqualTo: FirebaseAuth.instance.currentUser?.uid).get().then((value) {
      if(value.docs.isNotEmpty){
        return value.docs.single['Name'];

      }
    });
    username=n;
    print(username);
  }


}