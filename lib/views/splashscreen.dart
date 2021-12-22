// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/views/views.dart';
import 'dart:async';
class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}
class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                home()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return
      Container(
          color: Colors.white,
          child: Image(image: AssetImage('assets/logo.png'),),
      );
  }
}