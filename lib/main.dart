// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/views/views.dart';
import 'package:project_c/classes/custom_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:project_c/classes/load.dart';
import 'package:shared_preferences/shared_preferences.dart';
String globaladres = '';
String globalartworkname = '';
String globalartworkdesc = '';
String globalartist = '';
String globalurl='';
List<dynamic> globalfavlist = [];


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  globalfavlist= await getlist();
  runApp(
    Main()
  );
}
class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cavero Loods Tour',
      theme: ThemeData(
        primarySwatch:  CustomBlack,
        scaffoldBackgroundColor: colorCustombg,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context)=> splashscreen(),
        '/home': (context)=> home(),
        '/favoriet':(context)=> favoriet(),
        '/galerij':(context)=>galerij(),
        '/tour':(context)=>tour(),
        '/detail_pagina':(context)=>detail_pagina(),
        '/contact':(context)=>contact(),
      },
    );
  }
}


