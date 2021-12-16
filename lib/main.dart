// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/views/views.dart';
import 'package:project_c/widgets/widgets.dart';
import 'package:project_c/classes/custom_colors.dart';
import 'package:firebase_core/firebase_core.dart';

String globaladres = '';
String globalartworkname = '';
String globalartworkdesc = '';
String globalartist = '';
List<String> globalfavlist = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
        title: 'Cavero Loods Tour',
        theme: ThemeData(
          primarySwatch:  CustomBlack,
          scaffoldBackgroundColor: colorCustombg,
        ),
      initialRoute: '/home',
      routes: {
        '/home': (context)=> home(),
        '/favoriet':(context)=> favoriet(),
        '/galerij':(context)=>galerij(),
        '/tour':(context)=>tour(),
        '/detail_pagina':(context)=>detail_pagina(),
        '/contact':(context)=>contact(),
      },
    )
  );
}
