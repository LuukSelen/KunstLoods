// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'views/galerij.dart';
import 'views/detail_pagina.dart';
import 'views/tour.dart';
import 'views/favoriet.dart';
import 'views/home.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:math';


Map<int, Color> bgColor =
{
  50:Color.fromRGBO(33, 66, 73, .1),
  100:Color.fromRGBO(33, 66, 73, .2),
  200:Color.fromRGBO(33, 66, 73, .3),
  300:Color.fromRGBO(33, 66, 73, .4),
  400:Color.fromRGBO(33, 66, 73, .5),
  500:Color.fromRGBO(33, 66, 73, .6),
  600:Color.fromRGBO(33, 66, 73, .7),
  700:Color.fromRGBO(33, 66, 73, .8),
  800:Color.fromRGBO(33, 66, 73, .9),
  900:Color.fromRGBO(33, 66, 73, 1),
};

MaterialColor colorCustombg = MaterialColor(0xFF214249, bgColor);

Map<int, Color> buttonColor =
{
  50:Color.fromRGBO(166, 124, 46, .1),
  100:Color.fromRGBO(166, 124, 46, .2),
  200:Color.fromRGBO(166, 124, 46, .3),
  300:Color.fromRGBO(166, 124, 46, .4),
  400:Color.fromRGBO(166, 124, 46, .5),
  500:Color.fromRGBO(166, 124, 46, .6),
  600:Color.fromRGBO(166, 124, 46, .7),
  700:Color.fromRGBO(166, 124, 46, .8),
  800:Color.fromRGBO(166, 124, 46, .9),
  900:Color.fromRGBO(166, 124, 46, 1),
};

MaterialColor colorCustombutton = MaterialColor(0xFFA67C2E, buttonColor);

Map<int, Color> black =
{
  50:Color.fromRGBO(0, 0, 0, .1),
  100:Color.fromRGBO(0, 0, 0, .2),
  200:Color.fromRGBO(0, 0, 0, .3),
  300:Color.fromRGBO(0, 0, 0, .4),
  400:Color.fromRGBO(0, 0, 0, .5),
  500:Color.fromRGBO(0, 0, 0, .6),
  600:Color.fromRGBO(0, 0, 0, .7),
  700:Color.fromRGBO(0, 0, 0, .8),
  800:Color.fromRGBO(0, 0, 0, .9),
  900:Color.fromRGBO(0, 0, 0, 1),
};

MaterialColor CustomBlack = MaterialColor(0xFF000000, black);

Map<int, Color> grey =
{
  50:Color.fromRGBO(176, 157, 126, .1),
  100:Color.fromRGBO(176, 157, 126, .2),
  200:Color.fromRGBO(176, 157, 126, .3),
  300:Color.fromRGBO(176, 157, 126, .4),
  400:Color.fromRGBO(176, 157, 126, .5),
  500:Color.fromRGBO(176, 157, 126, .6),
  600:Color.fromRGBO(176, 157, 126, .7),
  700:Color.fromRGBO(176, 157, 126, .8),
  800:Color.fromRGBO(176, 157, 126, .9),
  900:Color.fromRGBO(176, 157, 126, 1),
};

MaterialColor CustomGreyText = MaterialColor(0xFFB09D7E, grey);

String globaladres = '';
String globalartworkname = '';
String globalartworkdesc = '';
String globalartist = '';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
        title: 'Cavero Loods Tour',
        theme: ThemeData(
          primarySwatch: Hexcolor("#FFB09D7E"),
          scaffoldBackgroundColor: colorCustombg,
        ),
      initialRoute: '/home',
      routes: {
        '/home': (context)=> home(),
        '/favoriet':(context)=> favoriet(),
        '/galerij':(context)=>galerij(),
        '/tour':(context)=>tour(),
        '/detail_pagina':(context)=>detail_pagina(),

      },
    )
  );
}
