import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/services/store.dart';
import 'package:e_commerce/models/product.dart';
class AddProduct extends StatelessWidget {
 static String id='AddProduct';
 String _name,_price,_description,_category,_imageLocation; 
 final _store=Store();
 final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalKey,
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              CustomTextField(
                hint:'Product Name',
                onClick: (value)
                {
                  _name=value;
                },
              ),
              SizedBox(  height: 10,),
              CustomTextField(
                hint: 'Product Price', 
                onClick: (value)
                {
                  _price=value;
                },
                ),
              SizedBox(  height: 10,),
              CustomTextField(
                hint: "Product Description",
                onClick: (value)
                {
                  _description=value;
                }, ),
               SizedBox(  height: 10,),
              CustomTextField(
                hint: "Product Category",
                onClick: (value)
                {
                  _category=value;
                },
                ),
              SizedBox(  height: 10,),
              CustomTextField(
                hint: 'Product Location',
                onClick: (value)
                {
                    _imageLocation=value;
                }, ),
               ElevatedButton(
              onPressed: ()
              {
                if(_globalKey.currentState.validate())
                {
                  _globalKey.currentState.save();
                  //save data to firestore
                    _store.addProduct(Product(
                      pName:_name,
                      pCatergory: _category,
                      pLocation: _imageLocation,
                      pPrice: _price,
                      PDescription: _description
                    ));
                }
              },
              child: Text('Add Product',style: TextStyle(color: Colors.black),),
              style: ElevatedButton.styleFrom(
                primary: Colors.white, 
             ),
            ),
              
        ],),
      ),
    );
  }
}