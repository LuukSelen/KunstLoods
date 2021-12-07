// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/main.dart';
import 'favoriet.dart';
import 'package:project_c/widgets/navbar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_c/main.dart';

class detail_pagina extends StatefulWidget {
  const detail_pagina({Key? key}) : super(key: key);

  @override
  _detail_paginaState createState() => _detail_paginaState();
}

class _detail_paginaState extends State<detail_pagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,

          title: Text(globalartworkname),
        ),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start  ,
            children:  <Widget>[
              Image(
                  image: AssetImage(globaladres)
              ),

              SizedBox(
                width: 300,
                child: Text(
                  globalartworkdesc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:navbar()// This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}




