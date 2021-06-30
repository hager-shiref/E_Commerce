import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/services/store.dart';
class EditProduct extends StatefulWidget {
static String id='EditProduct';

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store=Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _store.loadProduct(),
        builder:(context,snapshot){ 
         if(snapshot.hasData){
             List<Product>products=[];
           for(var doc in snapshot.data.docs){
             var data =doc.data();
             products.add(
               Product(
                 pCatergory: data[kProductCategory],
                 pDescription: data[kProductDescription],
                 pLocation: data[kProductLocation],
                 pName: data[kProductName],
                 pPrice: data[kProductPrice]
               )
             );
           }
            return ListView.builder(
          itemBuilder: (context,index)=>Text(products[index].pName),
        itemCount:products.length,
        );
         }
        else{
          return Center(child: CircularProgressIndicator());
        }
        }
      ),
    );
  }
   
  
}