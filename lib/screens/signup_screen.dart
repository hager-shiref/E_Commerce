import 'package:flutter/material.dart';
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:e_commerce/widgets/custom_stack.dart';
class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  static String id='SignUpScreen';
  @override
  Widget build(BuildContext context) {
          double height=MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: kMainColor,
        body: Form(
          key: _globalKey,
                  child: ListView(
            children: [
              CustomStack(),
              SizedBox(
                height: height*0.1,
              ),
              CustomTextField(hint: 'Enter your Name', icon: Icons.perm_identity),
              SizedBox(
                height: height*0.03,
              ),
              CustomTextField(hint: 'Enter your Email',icon: Icons.email,),
              SizedBox(
                height: height*0.03,
              ),
              CustomTextField(hint: 'Enter your Password', icon: Icons.lock),
              SizedBox(
                height: height*0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: InkWell(
                  onTap: (){
                   if( _globalKey.currentState.validate()){

                   }
                  },
                  child: Container(
                    height: height/20,
                 decoration: BoxDecoration( color: Colors.black,
                 borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text('Sign up',style: TextStyle(
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
                  Text("Do have an account ? ",
                  style: TextStyle(color: Colors.white,fontSize: 16),),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                                    child: Text('Login',
                    style: TextStyle(fontSize: 16),),
                  )
                ],
              )
            
            ],
          ),
        ),
    );
  }
}

