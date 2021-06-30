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
  List<Product>_products=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
          future: _store.loadProduct(),
        builder:(context,snapshot){ 
         if(snapshot.hasData){
            return ListView.builder(
          itemBuilder: (context,index)=>Text(snapshot.data[index].pName),
        itemCount:snapshot.data.length,
        );
         }
        else{
          return Center(child: CircularProgressIndicator());
        }
        }
      ),
    );
  }
  @override
  void initState(){
    getProducts();
  }
  void getProducts()async{
    _products=await _store.loadProduct();
  }
}