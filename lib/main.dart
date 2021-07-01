import 'package:e_commerce/admin/edit_product.dart';
import 'package:e_commerce/admin/mange_product.dart';
import 'package:e_commerce/provider/adminMode.dart';
import 'package:e_commerce/provider/modelHub.dart';
import 'package:e_commerce/admin/admin_home.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/signUp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_page.dart';
import 'admin/adminProduct.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHub>(
          create: (context) => ModelHub(),
        ),
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          HomePage.id: (context) => HomePage(),
          AdminHome.id: (context) => AdminHome(),
          AddProduct.id: (context) => AddProduct(),
          ManageProduct.id: (context) => ManageProduct(),
          EditProduct.id: (context) => EditProduct()
        },
      ),
    );
  }
}
