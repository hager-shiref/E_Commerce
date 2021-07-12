import 'package:e_commerce/constant.dart';
import 'package:e_commerce/services/store.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/models/product.dart';

class OrderDetails extends StatelessWidget {
  static String id = 'Order Details';
  Store _store = Store();
  @override
  Widget build(BuildContext context) {
    String documentId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: StreamBuilder(
          stream: _store.loadOrdersDetails(documentId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = [];
              for (var doc in snapshot.data.doc) {
                products.add(Product(
                    pName: doc.data[kProductName],
                    pQuantity: doc.data[kProductQuantity],
                    pCatergory: doc.data[kProductCategory]));
              }
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                color: kSecondryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                          'Product name : ${products[index].pName}',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Quantity : ${products[index].pQuantity}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Product Category : ${products[index].pCatergory}',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: ButtonTheme(
                            buttonColor: kMainColor,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text('Confirm Order'),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: ButtonTheme(
                          buttonColor: kMainColor,
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Delete Order')),
                        ))
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: Text('loading Order Details'),
              );
            }
          }),
    );
  }
}
