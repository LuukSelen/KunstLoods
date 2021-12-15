// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/main.dart';
import 'favoriet.dart';
import 'package:project_c/widgets/navbar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:permission_handler/permission_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  final Stream<QuerySnapshot> databaseart = FirebaseFirestore.instance.collection('loods_art').snapshots();

  var adres;
  var artworkname;
  var artworkdesc;
  var artist;
  _imageholderState(var adres,var artworkname, var artworkdesc, var artist){
    this.adres=adres;
    this.artworkname=artworkname;
    this.artworkdesc=artworkdesc;
    this.artist=artist;
  }

  Future _qrScanner() async{
    var cameraStatus = await Permission.camera.status;
    // var list=['Mooi Kunstwerk','Mona Lisa','Realiteit'];


    void showDetailpage() async{
      String? qrdata = await scanner.scan();
      print(qrdata);

      FirebaseFirestore.instance
          .collection('loods_art')
          .doc(qrdata)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          // print('Document data: ${documentSnapshot.data()}');
          globaladres = documentSnapshot.get('url');
          globalartworkname = documentSnapshot.get('name');
          globalartworkdesc = documentSnapshot.get('description');
          globalartist = documentSnapshot.get('artist');
          Navigator.pushNamed(context, '/detail_pagina', arguments: _imageholderState(globaladres, globalartworkname, globalartworkdesc, globalartist));
        } else {
          print('errrrorrrr, file document does not exist');
        }
      });

    }

    if(cameraStatus.isGranted)
    {
      showDetailpage();
    } else {
      var isGrant = await Permission.camera.request();
      if(isGrant.isGranted){
        showDetailpage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorCustombutton,
          title: Text('Cavero Loods Tour'),
        ),
        body: SingleChildScrollView(
          child:Center(

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start  ,
              children:  <Widget>[
                Image(
                  image: AssetImage('assets/logo.png'),
                  height:230,
                  fit: BoxFit.fill,
                ),
                SizedBox(
                  width: 300,
                  child: Text(
                    'Welkom bij de Cavero Loods tour. Op onze locaties zijn er meerdere plekken die interessant kunnen zijn. Wilt u kijken of er meer informatie is over een bepaalde plek? Dan kunt u gebruik maken van de camera om een scan te maken. Als er een match is zult u meer informatie krijgen.\n\n\n\n\n\n\n\nBegin met scannen door op de onderstaande knop te klikken.\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                FloatingActionButton.extended(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  foregroundColor: Colors.black,
                  backgroundColor: colorCustombutton,
                  elevation: 5,
                  // onPressed: () => _getFromCamera(),
                  onPressed: () => _qrScanner(),
                  label:Text('Scan een object'),
                  icon: Icon(Icons.add_a_photo ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:navbar()// This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}




