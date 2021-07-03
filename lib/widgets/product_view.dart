import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';

import '../functions.dart';
Widget productView(String pCategory,List<Product>allProducts) {
  List<Product>products;
  products=getproductByCatergory(pCategory,allProducts);
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 0.8),
    itemBuilder: (context, index) => Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GestureDetector(

        child: Stack(
          children: [
            Positioned.fill(
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage(products[index].pLocation),
                )),
            Positioned(
              bottom: 0,
              width: MediaQuery.of(context).size.width,
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          products[index].pName,
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        Text('\$ ${products[index].pPrice}')
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
    itemCount: products.length,
  );
}
