import 'package:bylaive/app_properties.dart';
import 'package:bylaive/models/product.dart';
import 'package:flutter/material.dart';

class ShopProduct extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  const ShopProduct(
    this.product, {
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: <Widget>[
            ShopProductDisplay(
              product,
              onPressed: onRemove,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkGrey,
                ),
              ),
            ),
            Text(
              '\$${product.price}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: darkGrey, fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ],
        ));
  }
}

class ShopProductDisplay extends StatelessWidget {
  final Product product;
  final VoidCallback onPressed;

  const ShopProductDisplay(this.product, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: Stack(children: <Widget>[
        Positioned(
          left:-10,
          bottom: 20,
          child: SizedBox(
            height: 150,
            width: 150,
            child: Transform.scale(
              scale: 0.7,
              child: Image.network('https://www.pngplay.com/wp-content/uploads/13/Yellow-Transparent-Images.png'),
            ),
          ),
        ),
        Positioned(
          left: 40,
          top: 5,
          child: SizedBox(
              height: 80,
              width: 80,
              child: Image.network(
                '${product.image}',
                fit: BoxFit.contain,
              )),
        ),
        Positioned(
          right: 25,
          bottom: 40,
          child: Align(
            child: IconButton(
              icon: Icon(Icons.close,color: Colors.red,),
              onPressed: onPressed,
            ),
          ),
        )
      ]),
    );
  }
}
