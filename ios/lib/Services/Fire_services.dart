import 'package:bylaive/Constants/Firebase_consts.dart';
import 'package:bylaive/Livestream/LiveStream.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirestoreServices{
//get users data
  static getUser(String email){
    return  FirebaseFirestore.instance.collection('Users').where('email', isEqualTo: email).snapshots();

  }
  static getSellerProducts(String id){
    return  FirebaseFirestore.instance.collection('Products').where('Seller_Uid', isEqualTo: id).snapshots();

  }

  static getProducts(catagory){
    return  FirebaseFirestore.instance.collection('Products').where('p_catagory', isNotEqualTo: catagory).snapshots();
  }
static getCart(String id){
  return  FirebaseFirestore.instance.collection('Cart').where('addedby', isEqualTo: id).snapshots();
}
  static deleteDoc(String docid){
    return  FirebaseFirestore.instance.collection(cartCollection).doc(docid).delete();
  }
  static getLiked(String id){
    return  FirebaseFirestore.instance.collection('Liked').where('addedby', isEqualTo: id).snapshots();

  }

}
