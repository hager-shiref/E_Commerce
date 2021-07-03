import 'models/product.dart';

List<Product> getproductByCatergory(String kJackets,List<Product> allProducts) {
  List<Product>products=[];
  for(var product in allProducts){
    if (product.pCatergory == kJackets){
      products.add(product);
    }
  }
  return products;
}