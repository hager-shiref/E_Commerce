import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:e_commerce/services/store.dart';
import 'package:e_commerce/widgets/product_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../functions.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth=Auth();
    User _loggedUser;
    int _tabBarIndex=0;
    final _store=Store();
    int _bottomBarIndex=0;
    List<Product>_products;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
            length: 4,
            child: Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _bottomBarIndex,
                fixedColor: kMainColor,
                onTap: (value){
                  setState(() {
                    _bottomBarIndex=value;
                  });
                    },
                items: [
                  BottomNavigationBarItem(
                      label: 'test',
                      icon: Icon(Icons.person)
                  ),
                  BottomNavigationBarItem(
                      label: 'test',
                      icon: Icon(Icons.person)
                  ),
                  BottomNavigationBarItem(
                      label: 'test',
                      icon: Icon(Icons.person)
                  ),
                  BottomNavigationBarItem(
                      label: 'test',
                      icon: Icon(Icons.person)
                  )
                ],
              ),
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                bottom: TabBar(
                  indicatorColor: kMainColor,
                  onTap: (value){
                    setState(() {
                      _tabBarIndex=value;
                    });
                    },
                  tabs: <Widget>[
                    Text('Jackets',style: TextStyle(
                      color: _tabBarIndex==0?Colors.black:kUnActiveColor,
                      fontSize: _tabBarIndex==0?16:null,
                    ),
                    ),
                    Text('Trousers',style: TextStyle(
                      color: _tabBarIndex==1?Colors.black:kUnActiveColor,
                      fontSize: _tabBarIndex==1?16:null,
                    ),),
                    Text('T-shirts',style: TextStyle(
                      color: _tabBarIndex==2?Colors.black:kUnActiveColor,
                      fontSize: _tabBarIndex==2?16:null,
                    ),),
                    Text('shoes',style: TextStyle(
                      color: _tabBarIndex==3?Colors.black:kUnActiveColor,
                      fontSize: _tabBarIndex==3?16:null,
                    ),)
                  ],
                ),
              ),
              body:TabBarView(
                children: [
                  jacketView(),
                  productView(kTrousers,_products),
                  productView(kShoes,_products),
                  productView(kT_shirts,_products)
                ],
              )
            )),
        Material(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 30, 20,0),
            child: Container(
              height: MediaQuery.of(context).size.height*0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Discover'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Icon(
                    Icons.shopping_cart
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }


  @override
  initState(){
    getCurrentUser();
  }
  getCurrentUser()async{
    _loggedUser=await _auth.getUser();
  }
  Widget jacketView() {
    return StreamBuilder(
        stream: _store.loadProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> products = [];
            for (var doc in snapshot.data.docs) {
              var data = doc.data();
              products.add(Product(
                  pId: doc.id,
                  pCatergory: data[kProductCategory],
                  pDescription: data[kProductDescription],
                  pLocation: data[kProductLocation],
                  pName: data[kProductName],
                  pPrice: data[kProductPrice]));
            }
            // list products from homePage is separated from others
            _products=[...products];
            _products.clear();
            products=getproductByCatergory(kJackets,_products);
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.8),
              itemBuilder: (context, index) => Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: GestureDetector(

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
        });
  }

}
