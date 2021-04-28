import 'package:e_commerce/screens/home_page.dart';
import 'package:e_commerce/screens/signUp_screen.dart';
import 'package:e_commerce/widgets/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:e_commerce/services/auth.dart';
class LoginScreen extends StatelessWidget {
  static String id='LoginScreen';
  String _email,_password;
  final _auth=Auth();
   final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
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
              CustomTextField(hint: 'Enter your Email',icon: Icons.email,
              onClick: (value)
              {
                  _email=value;
              },),
              SizedBox(
                height: height*0.05,
              ),
              CustomTextField(hint: 'Enter your password', icon: Icons.lock,
              onClick: (value)
              {
                  _password=value;
              },),
              SizedBox(
                height: height*0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: InkWell(
                  onTap: ()async
                  {
                    if(_globalKey.currentState.validate())
                    {
                     try{
                       _globalKey.currentState.save();
                      final result= await _auth.signIn(_email, _password);
                      Navigator.pushNamed(context, HomePage.id);
                     }
                     catch(e){
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text(e.message))
                       );
                     }
                    }
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
        ),
    );
  }
}

