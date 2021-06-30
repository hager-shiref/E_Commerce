import 'package:e_commerce/constant.dart';
import 'package:e_commerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/services/store.dart';
class EditProduct extends StatefulWidget {
static String id='EditProduct';

  @override
  _EditProductState createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final _store=Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: _store.loadProduct(),
        builder:(context,snapshot){ 
         if(snapshot.hasData){
             List<Product>products=[];
           for(var doc in snapshot.data.docs){
             var data =doc.data();
             products.add(
               Product(
                 pCatergory: data[kProductCategory],
                 pDescription: data[kProductDescription],
                 pLocation: data[kProductLocation],
                 pName: data[kProductName],
                 pPrice: data[kProductPrice]
               )
             );
           }
            return GridView.builder(
              gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8) ,
               itemBuilder: (context,index)=>Padding(
                 padding: const EdgeInsets.symmetric(
                   horizontal: 10,vertical: 10
                 ),
                 child: GestureDetector(
                   onTapUp: (details){
                      double dx =details.globalPosition.dx;
                      double dy=details.globalPosition.dy;
                      double dx2=MediaQuery.of(context).size.width-dx;
                      double dy2=MediaQuery.of(context).size.height-dy;
                     showMenu(context: context, position: RelativeRect.fromLTRB(dx, dy, dx2, dy2), 
                     items: [
                      PopupMenuItem(
                        child: Text('Edit')
                        ),
                        PopupMenuItem(
                          child:Text('Delete') 
                          )
                     ]);
                   },
                   child: Stack(
                     children: [
                       Positioned.fill(
                         child:Image(
                           fit: BoxFit.fill,
                           image: AssetImage(products[index].pLocation),
                         ) 
                       ),
                       Positioned(
                         bottom: 0,
                         width: MediaQuery.of(context).size.width,
                         child:Opacity(
                           opacity: 0.6,
                           child: Container(
                             height: 60,
                             color: Colors.white,
                             child: Padding(
                               padding: EdgeInsets.symmetric(
                                 horizontal: 10,vertical: 5
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(products[index].pName,style: TextStyle(fontWeight: FontWeight.bold),),
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
         }
        else{
          return Center(child: CircularProgressIndicator());
        }
        }
      ),
    );
  }
   
  
}