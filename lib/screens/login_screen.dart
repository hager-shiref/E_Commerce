import 'package:e_commerce/provider/adminMode.dart';
import 'package:e_commerce/provider/modelHub.dart';
import 'admin/admin_home.dart';
import 'file:///E:/Flutter/e_commerce/lib/screens/user/home_page.dart';
import 'package:e_commerce/screens/signUp_screen.dart';
import 'package:e_commerce/widgets/custom_stack.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/constant.dart';
import 'package:e_commerce/widgets/custom_text_field.dart';
import 'package:e_commerce/services/auth.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  String _email, _password;
  final _auth = Auth();
  bool isAdmin = false;
  final adminPassword = 'admin123456789';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            CustomStack(),
            SizedBox(
              height: height * 0.1,
            ),
            CustomTextField(
              hint: 'Enter your Email',
              icon: Icons.email,
              onClick: (value) {
                _email = value;
              },
            ),
            SizedBox(
              height: height * 0.05,
            ),
            CustomTextField(
              hint: 'Enter your Password',
              icon: Icons.lock,
              onClick: (value) {
                _password = value;
              },
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: InkWell(
                  onTap: () {
                    _validate(context);
                  },
                  child: Container(
                    height: height / 20,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have any account ? ",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUpScreen.id);
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Provider.of<AdminMode>(context, listen: false)
                          .changeIsAdmin(true);
                    },
                    child: Text(
                      'I\'m an admin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Provider.of<AdminMode>(context, listen: false)
                                  .isAdmin
                              ? kMainColor
                              : Colors.white),
                    ),
                  )),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      Provider.of<AdminMode>(context, listen: false)
                          .changeIsAdmin(false);
                    },
                    child: Text('I\'m a user',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Provider.of<AdminMode>(context).isAdmin
                                ? Colors.white
                                : kMainColor)),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _validate(BuildContext context) async {
    final modelHud = Provider.of<ModelHub>(context, listen: false);
    modelHud.changeIsLoading(true);
    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();
      if (Provider.of<AdminMode>(context, listen: false).isAdmin) {
        if (_password == adminPassword) {
          try {
            _auth.signIn(_email, _password);
            Navigator.pushNamed(context, AdminHome.id);
          } catch (e) {
            modelHud.changeIsLoading(false);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.message)));
          }
        } else {
          modelHud.changeIsLoading(false);
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Something went wrong ')));
        }
      } else {
        try {
          await _auth.signIn(_email, _password);
          Navigator.pushNamed(context, HomePage.id);
        } catch (e) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(e.message)));
        }
      }
    }
    modelHud.changeIsLoading(false);
  }
}
