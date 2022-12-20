import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class Options extends StatefulWidget {
  const Options({Key? key}) : super(key: key);

  @override
  State<Options> createState() => _OptionsState();
}

class _OptionsState extends State<Options> {
  final controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextField(controller: controller,),
          ElevatedButton(onPressed: (){
            final name=controller.text;
            createuser(name:name);
          }, child: Text('submit'))
        ],
      ),
    );
  }
}

Future createuser({required String name}) async{
  final docUser=FirebaseFirestore.instance.collection('Users').doc();
 final user=User(
   id:docUser.id,
   name:name,
 );
 final json=user.toJson();
  await docUser.set(json);

  
}

class User{
  String id;
  final String name;
  User({
   this.id='',
   required this.name,
});
  Map<String, dynamic> toJson()=>{
    'id':id,
    'name':name
  };
}
