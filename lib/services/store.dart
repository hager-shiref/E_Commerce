import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Store {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  addProduct(Product product) {
    _firestore.collection(kProductsCollection).add({
      kProductName: product.pName,
      kProductPrice: product.pPrice,
      kProductLocation: product.pLocation,
      kProductCategory: product.pCatergory,
      kProductDescription: product.pDescription
    });
  }

  Stream<QuerySnapshot> loadProduct() {
    return _firestore
        .collection(kProductsCollection)
        .snapshots(); //snapshots to update the data
  }

  deleteProduct(documentId) {
    _firestore.collection(kProductsCollection).doc(documentId).delete();
  }
  editProduct(data,documentId){
    _firestore.collection(kProductsCollection).doc(documentId).update(data);
  }
}
