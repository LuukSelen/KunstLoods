// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/main.dart';

class imageholder extends StatefulWidget {
  var adres;
  var artworkname;
  var artworkdesc;

  imageholder(String s, String b , String c){
    this.adres=s;
    this.artworkname=b;
    this.artworkdesc=c;
  }
  @override
  _imageholderState createState() => _imageholderState(adres,artworkname,artworkdesc);
}

class _imageholderState extends State<imageholder> {
  var adres;
  var artworkname;
  var artworkdesc;
  _imageholderState(var adres,var artworkname, var artworkdesc){
    this.adres=adres;
    this.artworkname=artworkname;
    this.artworkdesc=artworkdesc;
  }
  _selectTab() {
    globaladres = adres;
    globalartworkname = artworkname;
    globalartworkdesc = artworkdesc;
    Navigator.pushNamed(context, '/detail_pagina', arguments: _imageholderState(adres, artworkname, artworkdesc));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
       body: Center(
         child: Column(
             children: <Widget>[
               SizedBox(height: 10),
               InkWell(
                 child: Container(
                   width: 300,
                   height: 150,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(
                       topRight: Radius.circular(40),
                       topLeft: Radius.circular(40),
                     ),
                     image: DecorationImage(
                       image: AssetImage(adres),
                       fit: BoxFit.fill,
                     ),

                   ),
                 ),
                 onTap: ()=>_selectTab(),
               ),
               InkWell(
                 child: Container(
                   width: 300,
                   height: 100,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(
                       bottomRight: Radius.circular(40),
                       bottomLeft: Radius.circular(40),
                     ),
                     color: Colors.white,
                   ),
                   child: Column(
                       children: <Widget>[
                         SizedBox(height: 3),
                         Text(artworkname,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                         SizedBox(height: 10),
                         Text(artworkdesc,textAlign: TextAlign.center),
                       ]
                   ),
                 ),
                 onTap: ()=>_selectTab(),
               )
             ]
         ),
       )
    );
  }
}
