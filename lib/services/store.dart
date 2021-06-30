import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store
{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;
  addProduct(Product product)
  {
      _firestore.collection(kProductsCollection).add(
        {
            kProductName: product.pName,
            kProductPrice: product.pPrice,
            kProductLocation:product.pLocation,
            kProductCategory:product.pCatergory,
            kProductDescription:product.pDescription
        }
      );
  }
  Future<List<Product>>loadProduct()async
  {
   var snapshot=await _firestore.collection(kProductsCollection).get();
    List <Product> products=[];
   for(var doc in snapshot.docs)
   {
     var data=doc.data();
     products.add(
       Product(
         pPrice: data[kProductPrice],
         pCatergory: data[kProductCategory],
         pDescription: kProductDescription,
         pLocation: data[kProductLocation],
         pName: data[kProductName]
       )
     );
   }
   return products;
  }
}