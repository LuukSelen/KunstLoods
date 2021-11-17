// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'views/galerij.dart';
import 'views/tour.dart';
import 'views/favoriet.dart';
import 'views/home.dart';


void main() {
  runApp(
    MaterialApp(
        title: 'Cavero Loods Tour',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
      initialRoute: '/home',
      routes: {
        '/home': (context)=> home(),
        '/favoriet':(context)=> favoriet(),
        '/galerij':(context)=>galerij(),
        '/tour':(context)=>tour(),

      },
    )
  );
}
