import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/provider/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static String id = "Cart Screen";
  @override
  Widget build(BuildContext context) {
    List<Product> products = Provider.of<CartItem>(context).products;
    final double screenHeight=MediaQuery.of(context).size.height;
    final double screenWidth=MediaQuery.of(context).size.width;
    final double appBarHeight=AppBar().preferredSize.height;
    final double statusBarHeight=MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('My Cart',style: TextStyle(color: Colors.black),),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,color: Colors.black,),
        ),
      ),
      body: Column(
        children: [
          LayoutBuilder(
              builder: (context,constrains){
                if(products.isNotEmpty){
                  return Container(
                    height: screenHeight-statusBarHeight-appBarHeight-(screenHeight*0.8),
                    child: ListView.builder(
                        itemBuilder: (context,index){
                          return Padding(
                              padding: EdgeInsets.all(15),
                            child: Container(
                              height: screenHeight*0.15,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: screenHeight*0.15/2,
                                    backgroundImage:AssetImage(products[index].pLocation) ,
                                  ),
                                  Expanded(child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(products[index].pName,style: TextStyle(
                                            fontSize: 18,fontWeight: FontWeight.bold
                                          ),),
                                          SizedBox(height: 10,),
                                          Text('\$ ${products[index].pPrice}',style: TextStyle(
                                            fontWeight: FontWeight.bold
                                          ),)
                                        ],
                                      ),
                                    ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 20),
                                        child: Text(
                                          products[index].pQuantity.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ), )
                                  ],))
                                ],
                              ),
                              color: kSecondryColor,
                            ),
                          );
                        },
                      itemCount: products.length,
                        ),
                  );
                }
                else{
                  return Container(
                    height: screenHeight-(screenHeight*0.08)-appBarHeight-statusBarHeight,
                    child: Center(
                      child: Text('Cart is Empty'),
                    ),
                  );
                }
              }),
          Builder(builder: (context)=> ButtonTheme(
            minWidth: screenWidth,
            height: screenHeight*0.08,
            child: ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10)
                  )
                )
              ),
              child: Text('Order'.toUpperCase()),

            ),
          ))
        ],
      ),
    );
  }
}
