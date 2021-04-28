import 'package:e_commerce/provider/modelHub.dart';
import 'package:e_commerce/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/signUp_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/home_page.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelHub>(
      create: (context)=>ModelHub(),
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: LoginScreen.id,
        routes: {
          LoginScreen.id:(context)=>LoginScreen(),
          SignUpScreen.id:(context)=>SignUpScreen(),
          HomePage.id:(context)=>HomePage()
        },
      ),
    );
  }
}