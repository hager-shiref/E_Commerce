import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/provider/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CartScreen extends StatelessWidget {
  static String id="Cart Screen";
  @override
  Widget build(BuildContext context) {
    List <Product> products= Provider.of<CartItem>(context).products;
    return Scaffold(
      body: ListView.builder(
        itemCount: products.length,
          itemBuilder: (context,index){
            return Container(

            );

          }),
    );
    
  }
}
