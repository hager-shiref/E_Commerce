import 'package:flutter/material.dart';

class CustomStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(image: AssetImage('assets/icons/buyicon.png')),
            Positioned(
                bottom: 0,
                child: Text(
                  'Buy it',
                  style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
