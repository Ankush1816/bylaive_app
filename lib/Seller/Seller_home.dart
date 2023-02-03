import 'package:bylaive/Constants/Strings.dart';
import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Seller/AddProduct.dart';
import 'package:bylaive/Seller/Seller_Products.dart';
import 'package:bylaive/Seller/Seller_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Widgets/Dash_buttom.dart';

class SellerHome extends StatefulWidget {
  const SellerHome({Key? key}) : super(key: key);

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primary,
        foregroundColor: Colors.black,
        onPressed: () {
          Get.to(Addproduct());
        },
        icon: Icon(Icons.add),
        label: Text('Add product'),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dashbuttom(context,
                      title: 'Products',
                      count: '10',
                      image:
                          'https://png.pngtree.com/png-vector/20190419/ourlarge/pngtree-vector-online-shopping-icon-png-image_956355.jpg',
                      onTap: () {
                    Get.to(SellerProducts());
                  }),
                  dashbuttom(context,
                      title: 'Orders',
                      count: '10',
                      image:
                          'https://static.vecteezy.com/system/resources/thumbnails/002/590/547/small/box-carton-delivery-line-style-icon-free-vector.jpg',
                      onTap: () {
                    Get.to(Sellerorders());
                  }),
                ],
              ),
              15.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  dashbuttom(context,
                      title: 'Cashflow',
                      count: '',
                      image:
                          'https://static.vecteezy.com/system/resources/thumbnails/015/891/046/small/product-description-icon-outline-compare-product-vector.jpg'),
                  dashbuttom(context,
                      title: 'Others',
                      count: '',
                      image:
                          'https://static.vecteezy.com/system/resources/previews/015/890/890/original/laptop-product-review-icon-outline-online-customer-vector.jpg'),
                ],
              ),
              10.heightBox,
              Text(
                'Popular products',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              20.heightBox,
              Column(
                children: [
                  Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ListView(
                          shrinkWrap: true,
                          children: List.generate(
                              30,
                              (index) => ListTile(
                                    leading: Image.network(
                                      img1,
                                      fit: BoxFit.cover,
                                    ),
                                    title: Text('Title'),
                                    subtitle: Text('100'),
                                  )),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
