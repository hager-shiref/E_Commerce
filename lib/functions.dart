import 'models/product.dart';

List<Product> getProductByCatergory(
    String kJackets, List<Product> allProducts) {
  List<Product> products = [];
  try{
    for (var product in allProducts) {
      if (product.pCatergory == kJackets) {
        products.add(product);
      }
    }
  }
 on Error catch(e){
    print(e);
  }
  return products;
}
