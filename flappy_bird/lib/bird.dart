import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  const Bird({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/bird.png',
        scale:  0.7,
      ),
    );
  }
}