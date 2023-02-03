import 'package:bylaive/Constants/colours.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Constants/Strings.dart';

class Sellerorders extends StatefulWidget {
  const Sellerorders({Key? key}) : super(key: key);

  @override
  State<Sellerorders> createState() => _SellerordersState();
}

class _SellerordersState extends State<Sellerorders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: primary,
        title: Text("Orders"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(
                20,
                (index) => ListTile(
                      onTap: () {},
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                      leading: Image.network(
                        img1,
                        fit: BoxFit.cover,
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text('Title'),
                          4.heightBox,
                          Text('\$100'),
                      ],),
                      subtitle: Column(
                        children: [
                          Text('dfvbdgvdv')
                        ],
                      ),
                    )
                        .box
                        .margin(EdgeInsets.only(bottom: 8))
                        .color(Colors.grey.withOpacity(0.3)).roundedSM
                        .make()),
          ),
        ),
      ),
    );
  }
}
