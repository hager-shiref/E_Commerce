import 'models/product.dart';

List<Product> getProductByCatergory(String kProduct, List<Product> allProducts) {
  List<Product> products = [];
  try{
    if(allProducts !=null ){
      for (var product in allProducts) {
        if (product.pCatergory == kProduct) {
          products.add(product);
        }
      }
    }
  }
 on Error catch(e){
    print(e);
  }
  return products;
}
