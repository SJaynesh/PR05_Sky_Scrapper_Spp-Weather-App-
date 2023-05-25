import 'dart:async';

import 'package:flutter/material.dart';

import '../../utills/all_Atributes.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushNamedAndRemoveUntil("HomePage", (route) => false);
    });

    Size s = MediaQuery.of(context).size;
    double h = s.height;
    double w = s.width;

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(LogoimagePath + "logo.gif"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xff020b31),
    );
  }
}
