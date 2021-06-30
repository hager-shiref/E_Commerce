import 'package:e_commerce/provider/modelHub.dart';
import 'package:e_commerce/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:e_commerce/widgets/custom_stack.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState>_globalKey=GlobalKey<FormState>();
  static String id='SignUpScreen';
  String _email,_password;
  final _auth=Auth();
  @override
  Widget build(BuildContext context) {
          double height=MediaQuery.of(context).size.height;
    return Scaffold(
    backgroundColor: kMainColor,
    body: ModalProgressHUD(
      inAsyncCall: Provider.of<ModelHub>(context).isLoading,
              child: Form(
        key: _globalKey,
                child: ListView(
          children: [
            CustomStack(),
            SizedBox(
              height: height*0.1,
            ),
            CustomTextField(hint: 'Enter your Name', icon: Icons.perm_identity,
            onClick:(value)
            {
                _email=value;
            } ,),
            SizedBox(
              height: height*0.03,
            ),
            CustomTextField(hint: 'Enter your Email',icon: Icons.email,
            onClick: (value)
            {
              _email=value;
            },),
            SizedBox(
              height: height*0.03,
            ),
            CustomTextField(hint: 'Enter your Password', icon: Icons.lock,
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
                onTap: ()async{
                  final modelHub=Provider.of<ModelHub>(context,listen: false);
                  modelHub.changeIsLoading(true);
                 if( _globalKey.currentState.validate())
                 {
                        try
                        {
                       _globalKey.currentState.save();
                     final result= await _auth.signUp(_email, _password);
                     modelHub.changeIsLoading(false);
                      Navigator.pushNamed(context, HomePage.id);
                   }
                      catch(e){
                        modelHub.changeIsLoading(false);
                     ScaffoldMessenger.of(context).showSnackBar(
                       SnackBar(content: Text(e.message))
                     );
                   }
                       
                 }
                 modelHub.changeIsLoading(false);
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
    ),
      );
  }
}

