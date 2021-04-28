import 'package:e_commerce/screens/signUp_screen.dart';
import 'package:e_commerce/widgets/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
class LoginScreen extends StatelessWidget {
  static String id='LoginScreen';
  @override
  Widget build(BuildContext context) {
      double height=MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kMainColor,
        body: ListView(
          children: [
            CustomStack(),
            SizedBox(
              height: height*0.1,
            ),
            CustomTextField(hint: 'Enter your Email',icon: Icons.email,),
            SizedBox(
              height: height*0.05,
            ),
            CustomTextField(hint: 'Enter your password', icon: Icons.lock),
            SizedBox(
              height: height*0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: InkWell(
                onTap: (){
                  
                },
                child: Container(
                  height: height/20,
               decoration: BoxDecoration( color: Colors.black,
               borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text('Login',style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              )),
            ),
            SizedBox(
              height: height*0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have any account ? ",
                style: TextStyle(color: Colors.white,fontSize: 16),),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, SignUpScreen.id);
                  },
                                  child: Text('SignUp',
                  style: TextStyle(fontSize: 16),),
                )
              ],
            )
          
          ],
        ),
    );
  }
}

