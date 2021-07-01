import 'package:e_commerce/admin/adminProduct.dart';
import 'package:e_commerce/constant.dart';
import 'package:flutter/material.dart';

import 'mange_product.dart';

class AdminHome extends StatelessWidget {
  static String id = 'AdminHome';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, AddProduct.id);
            },
            child: Text(
              'Add Product',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white, // background
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ManageProduct.id);
            },
            child: Text(
              'Edit Product',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'View Orders',
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
