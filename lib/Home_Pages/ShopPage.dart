import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ElevatedButton(onPressed: (){
        FirebaseAuth.instance.signOut();


      }, child: Text('submit')),
    );
  }
}
