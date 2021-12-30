// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/main.dart';

class imageholder extends StatefulWidget {
  var adres;
  var artworkname;
  var artworkdesc;
  var artist;
  var url;

  imageholder(String s, String b , String c, String d, String e){
    this.adres=s;
    this.artworkname=b;
    this.artworkdesc=c;
    this.artist=d;
    this.url=e;
  }
  @override
  _imageholderState createState() => _imageholderState(adres,artworkname,artworkdesc,artist,url);
}

class _imageholderState extends State<imageholder> {
  var adres;
  var artworkname;
  var artworkdesc;
  var artist;
  var url;

  _imageholderState(var adres,var artworkname, var artworkdesc, var artist, var url){
    this.adres=adres;
    this.artworkname=artworkname;
    this.artworkdesc=artworkdesc;
    this.artist=artist;
    this.url= url;
  }
  _selectTab() {
    globaladres = adres;
    globalartworkname = artworkname;
    globalartworkdesc = artworkdesc;
    globalartist = artist;
    globalurl=url;
    Navigator.pushNamed(context, '/detail_pagina', arguments: _imageholderState(adres, artworkname, artworkdesc, artist, url));

  }
  @override
  Widget build(BuildContext context) {
    return
        Center(
         child: Column(
             children: <Widget>[
               SizedBox(height: 10),
               InkWell(
                 child: Container(
                   width: 300,
                   height: 190,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(
                       topRight: Radius.circular(10),
                       topLeft: Radius.circular(10),
                     ),
                     image: DecorationImage(
                       // placeholder: ''
                       image: adres != 'noImage'
                           ? NetworkImage(adres)
                           : AssetImage('assets/images/noImageAvailable.png') as ImageProvider,
                       fit: BoxFit.cover,
                     ),

                   ),
                 ),
                 onTap: ()=>_selectTab(),
               ),
               InkWell(
                 child: Container(
                   width: 300,
                   height: 40,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.only(
                       bottomRight: Radius.circular(10),
                       bottomLeft: Radius.circular(10),
                     ),
                     color: Colors.white,
                   ),
                   child: Column(
                       children: <Widget>[
                         SizedBox(height: 4),
                         Text(artworkname,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                         SizedBox(height: 2),
                         // Flexible(
                         //   child: Text(artworkdesc,textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
                         // ),
                         Padding(
                           padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                           // Text(artworkdesc,textAlign: TextAlign.center, overflow: TextOverflow.ellipsis),
                           child: Text(
                               artworkdesc,
                               maxLines: 1,
                               textAlign: TextAlign.center,
                               overflow: TextOverflow.fade,
                               softWrap: false,
                           ),
                         )
                       ],
                   ),
                 ),
                 onTap: ()=>_selectTab(),
               ),
             ],
       ),
    );
  }
}
