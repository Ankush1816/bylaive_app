import 'package:bylaive/Checkout/payment_page.dart';
import 'package:bylaive/Constants/Lists.dart';
import 'package:bylaive/Constants/Strings.dart';
import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Controllers/Product_controller.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Home_Pages/Home_others/CatagoryDetails.dart';

class ProductDetails extends StatelessWidget {
  final String? title;
  final dynamic data;

  const ProductDetails({Key? key, this.title, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Product_controller());
    var Controller = Get.find<Product_controller>();
    var Quantity = int.parse(data['p_quantity']);
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        iconTheme: IconThemeData(color: primary),
        title: title!.text.black.make(),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back(result: CatagoryDetails());
            },
            icon: Icon(
              Icons.arrow_back,
              color:  primary,
            )),
        actions: [
          IconButton(
            onPressed: () { Controller.AddtoLiked(
                context: context,
                img: data['p_image'][Controller.Colorindex.value],
              //  color: data['p_colors'],
                qty: Controller.quantity.value,
               // seller: data['p_seller'],
                title: data['p_name'],
             //   p_id: data['p_id'],
                tprice: Controller.TotalPrice.value);},
            icon: Icon(
              Icons.bookmark_add,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        color:  Color(0xffEEEDF3),
        child: Column(
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        itemCount: data['p_image'].length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            data['p_image'][index],
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                    Row(
                      children: [
                        Text(
                          data['p_name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ],
                    ),
                    10.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\₹ ${data['p_price']}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                        VxRating(
                          value: double.parse(data['p_rating']),
                          isSelectable: false,
                          onRatingUpdate: (value) {},
                          normalColor: Colors.grey,
                          selectionColor: Colors.yellow,
                          maxRating: 5,
                          count: 5,
                        ),
                      ],
                    ),
                    5.heightBox,
                    Obx(
                      () => Column(
                        children: [
                          Row(
                            children: [
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                          Row(
                            children: [
                              SizedBox(
                                width: 60,
                                child: Text(
                                  'Quantity',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              Obx(
                                () => Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Controller.DecreaseQuantity();
                                          Controller.CalculatePrice(
                                              int.parse(data['p_price']));
                                        },
                                        icon: Icon(Icons.remove,
                                            color: Colors.black)),
                                    Controller.quantity.value.text.make(),
                                    IconButton(
                                        onPressed: () {
                                          if (Controller.quantity.value >
                                              Quantity - 1) {
                                          } else {
                                            Controller.IncreaseQuantity();
                                            Controller.CalculatePrice(
                                                int.parse(data['p_price']));
                                          }
                                        },
                                        icon:
                                            Icon(Icons.add, color: Colors.black)),
                                    30.widthBox,
                                    Text(
                                      'Available: ${data['p_quantity']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ).box.padding(EdgeInsets.all(8)).make(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                    //width: 70,
                                    child: Text(
                                  "Total:-${Controller.TotalPrice.value}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.black),
                                )),
                                30.heightBox,
                              ],
                            ),
                          )
                        ],
                      ).box
                          .color(Colors.white)
                          .rounded
                          .clip(Clip.antiAlias)
                          .outerShadowMd
                          .make(),
                    ),
                    15.heightBox,
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          5.heightBox,
                          Text(
                            data['p_description'],
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: darkFontGrey),
                          )
                        ],
                      ),
                    ),
                    Text(
                      'Products people also like',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: darkFontGrey),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            9,
                            (index) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.network(
                                      cat[index],
                                      width: 130,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                    5.heightBox,
                                    Text(
                                      catagorynames[index],
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    Text(
                                      '\$100',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: primary),
                                    ),
                                    4.heightBox
                                  ],
                                )
                                    .box
                                    .white
                                    .margin(EdgeInsets.symmetric(horizontal: 4))
                                    .roundedSM
                                    .make()),
                      ),
                    )
                  ],
                ),
              ),
            )),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {Get.to(PaymentPage());},
                    child: Text('Buy now'),
                    style: ElevatedButton.styleFrom(
                        primary: primary,
                        padding:
                            EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                        textStyle:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Controller.AddtoCart(
                          context: context,
                          img: data['p_image'][Controller.Colorindex.value],
                         // color: data['p_colors'],
                          qty: Controller.quantity.value,
                        //  seller: data['p_seller'],
                          title: data['p_name'],
                          tprice: Controller.TotalPrice.value);

                    },
                    child: Text('Add to cart'),
                    style: ElevatedButton.styleFrom(
                        primary: primary,
                        padding:
                            EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                        textStyle:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
