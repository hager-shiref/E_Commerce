import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/store.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class EditProduct extends StatelessWidget {
  static String id = 'EditProduct';
  String _name, _price, _description, _category, _imageLocation;
  final _store = Store();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //pass data from manageProduct class to edit with navigation arguments
    Product product =ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Form(
        key: _globalKey,
        child:ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  hint: 'Product Name',
                  onClick: (value) {
                    _name = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Product Price',
                  onClick: (value) {
                    _price = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: "Product Description",
                  onClick: (value) {
                    _description = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: "Product Category",
                  onClick: (value) {
                    _category = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  hint: 'Product Location',
                  onClick: (value) {
                    _imageLocation = value;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();
                      _store.editProduct(({
                        kProductName: _name,
                        kProductCategory:_category,
                        kProductDescription:_description,
                        kProductPrice:_price,
                        kProductLocation:_imageLocation
                      } ),
                          product.pId
                      );
                    }
                  },
                  child: Text(
                    'Add Product',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}
