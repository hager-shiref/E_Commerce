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
            kProductDescription:product.PDescription
        }
      );
  }
}