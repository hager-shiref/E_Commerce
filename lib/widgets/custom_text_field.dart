import 'package:flutter/material.dart';
import 'package:e_commerce/constant.dart';
class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final Function onClick;
  String _errorMessage(String hint){
      switch(hint){
        case 'Enter your Name': return 'Name is Empty';
        case 'Enter your Email': return 'Email is Empty';
        case 'Enter your Password':return'Password is Empty';
      }
  }
  CustomTextField({@required this.hint, this.icon,@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        validator: (value){
          if(value.isEmpty){return _errorMessage(hint);}
        },
        onSaved:onClick ,
        obscureText: hint== 'Enter your Password'? true:false,
        cursorColor: kMainColor,
        decoration: InputDecoration(
          hintText: hint,
          prefix: Icon(
            icon
          ),
          filled: true,
          fillColor: KSecondryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.white
            )
          )
         ,focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white
            )
         ),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white
            )
         ),
        ),
      ),
    );
  }
}