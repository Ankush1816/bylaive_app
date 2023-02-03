import 'package:bylaive/Constants/colours.dart';
import 'package:bylaive/Seller/Seller_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import '../Controllers/Product_controller.dart';
import 'Widgets/Dropdown.dart';
import 'Widgets/Product_image.dart';

class Addproduct extends StatefulWidget {
  Addproduct({Key? key}) : super(key: key);

  @override
  State<Addproduct> createState() => _AddproductState();
}

class _AddproductState extends State<Addproduct> {
  String _dropdownValue = "Indian Clothing";
  List<String> dropDownOptions = [
    'Indian Clothing',
    'Western Clothing',
    'Jwellery',
    'Party',
    'Sunglasses',
    'Accesories',
    'Bags',
    'Home decor',
    'Kids'
  ];

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _dropdownValue = selectedValue;
      });
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _catagory = TextEditingController();

  final TextEditingController _name = TextEditingController();

  final TextEditingController _description = TextEditingController();

  final TextEditingController _unit = TextEditingController();

  final TextEditingController _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(Product_controller());
    var Controller = Get.find<Product_controller>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back(result: SellerHome());
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Column(
            children: [
              10.heightBox,
              Text(
                'Add new product',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              20.heightBox,
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'Product title'),
                controller: _name,
              ),
              10.heightBox,
              TextFormField(
                minLines: 4,
                maxLines: 6,
                decoration:
                    textInputDecoration.copyWith(hintText: 'Description'),
                controller: _description,
              ),
              10.heightBox,
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'Price/unit'),
                controller: _price,
              ),
              10.heightBox,
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'Available units'),
                controller: _unit,
              ),
              10.heightBox,
              //Text("Selected value: $_dropdownValue"),
              DropdownButton(
                items: dropDownOptions
                    .map<DropdownMenuItem<String>>((String mascot) {
                  return DropdownMenuItem<String>(
                      child: Text(mascot), value: mascot);
                }).toList(),
                value: _dropdownValue,
                onChanged: dropdownCallback,
                iconSize: 25.0,
                iconEnabledColor: Colors.grey,
                icon: const Icon(Icons.arrow_drop_down_outlined),
                isExpanded: true,
                style: const TextStyle(
                  color: primary,
                ),
              )
                  .box
                  .white
                  .padding(EdgeInsets.symmetric(horizontal: 10))
                  .roundedSM
                  .make(),
              15.heightBox,
              Text(
                'Add image',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              15.heightBox,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                      3,
                      (index) => Controller.pImagesLists[index] != null
                          ? Image.file(
                              Controller.pImagesLists[index],
                              width: 100,
                              height: 100,
                            ).onTap(() {
                              Controller.pickImage(index, context);
                            })
                          : productImage(
                              onpress: () {
                                Controller.pickImage(index, context);
                              },
                              label: index + 1)),
                ),
              ),
              18.heightBox,
              ElevatedButton(
                  onPressed: () async => {
                        if (_description.text == "" ||
                            _name.text == "" ||
                            _price == "" ||
                            _unit.text == "" ||
                            Controller.pImagesLists[0] == null)
                          {
                            VxToast.show(context,
                                msg: "Please add all the fields")
                          }
                        else
                          {
                            await Controller.uploadImage(),
                            Controller.AddProduct(
                                p_description: _description.text,
                                p_name: _name.text,
                                p_price: _price.text,
                                p_quantity: _unit.text,
                                p_catagory: _dropdownValue)
                          }
                      },
                  child: Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}

const textInputDecoration = InputDecoration(
  fillColor: Color.fromARGB(255, 239, 239, 239),
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Color.fromARGB(255, 239, 239, 239), width: 1.5)),
);
