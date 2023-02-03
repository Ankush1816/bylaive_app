import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget
productDropdown() {
  return DropdownButtonHideUnderline(
          child: DropdownButton(
            hint: Text('Select catagory'),
              value: null,
              isExpanded: true,
              items: [
                DropdownMenuItem(
                    child: Text("Indian Clothing"),
                    value: "Indian Clothing"
                ),
                DropdownMenuItem(
                  child: Text("Western Clothing"),
                  value: "Western Clothing",
                ),
                DropdownMenuItem(
                  child: Text("Jwellery"),
                  value: "Jwellery",
                ),
                DropdownMenuItem(
                  child: Text("Party"),
                  value: "Party",
                ),
                DropdownMenuItem(
                  child: Text("Sunglasses"),
                  value: "Sunglasses",
                ),
                DropdownMenuItem(
                  child: Text("Accesories"),
                  value: "Accesories",
                ),
                DropdownMenuItem(
                  child: Text("Bags"),
                  value: "Bags",
                ),
                DropdownMenuItem(
                  child: Text("Home decor"),
                  value: "Home decor",
                ),
                DropdownMenuItem(
                  child: Text("Kids"),
                  value: "Kids",
                ),
              ],
              onChanged: (value) {}))
      .box
      .white
      .padding(EdgeInsets.symmetric(horizontal: 10))
      .roundedSM
      .make();
}
