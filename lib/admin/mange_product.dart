import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/services/store.dart';

import 'edit_product.dart';

class ManageProduct extends StatefulWidget {
  static String id = 'ManageProducts';

  @override
  _ManageProductState createState() => _ManageProductState();
}

class _ManageProductState extends State<ManageProduct> {
  final _store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _store.loadProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Product> products = [];
              for (var doc in snapshot.data.docs) {
                var data = doc.data();
                products.add(Product(
                    pId: doc.documentID,
                    pCatergory: data[kProductCategory],
                    pDescription: data[kProductDescription],
                    pLocation: data[kProductLocation],
                    pName: data[kProductName],
                    pPrice: data[kProductPrice]));
              }
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.8),
                itemBuilder: (context, index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GestureDetector(
                    onTapUp: (details) {
                      double dx = details.globalPosition.dx;
                      double dy = details.globalPosition.dy;
                      double dx2 = MediaQuery.of(context).size.width - dx;
                      double dy2 = MediaQuery.of(context).size.height - dy;
                      showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(dx, dy, dx2, dy2),
                          items: [
                            MyPopupMenuItem(
                              child: Text('Edit'),
                              onClick: () {
                                Navigator.pushNamed(context, EditProduct.id,arguments: products[index]);
                              },
                            ),
                            MyPopupMenuItem(
                                child: Text('Delete'),
                                onClick: () {
                                  _store.deleteProduct(products[index].pId);
                                  Navigator.pop(context);
                                })
                          ]);
                    },
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: Image(
                          fit: BoxFit.fill,
                          image: AssetImage(products[index].pLocation),
                        )),
                        Positioned(
                          bottom: 0,
                          width: MediaQuery.of(context).size.width,
                          child: Opacity(
                            opacity: 0.6,
                            child: Container(
                              height: 60,
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      products[index].pName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$ ${products[index].pPrice}')
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                itemCount: products.length,
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(
                backgroundColor: kMainColor,
              ));
            }
          }),
    );
  }
}

//override the PopUpMenuItem class
class MyPopupMenuItem<T> extends PopupMenuItem<T> {
  final Widget child;
  final Function onClick;
  MyPopupMenuItem({@required this.child, @required this.onClick})
      : super(child: child);
  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() {
    return MyPopupMenuItemState();
  }
}

class MyPopupMenuItemState<T, PopMenuItem>
    extends PopupMenuItemState<T, MyPopupMenuItem<T>> {
  @override
  void handleTap() {
    widget.onClick();
  }
}
