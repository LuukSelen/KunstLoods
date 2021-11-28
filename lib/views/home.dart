// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/main.dart';
import 'favoriet.dart';
import 'package:project_c/widgets/navbar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  _selectTab() {
    Navigator.pushNamed(context, '/camera');

  }
  File? imageFile;
  void _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          centerTitle: true,

          title: Text('Cavero Loods Tour'),
        ),
        body: Center(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start  ,
            children:  <Widget>[
              Image(
                  image: AssetImage('assets/logo.png')
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'Welkom bij de Cavero Loods tour. Op onze locaties zijn er meerde plekken die interessant kunnen zijn. Wilt u kijken of er meer informatie is over een bepaalde plek? Dan kunt u gebruik maken van de camera om een scan te maken. Als er een match is zult u meer informatie krijgen.\n\n\n\n\n\n\n\nBegin met scannen door op de onderstaande knop te klikken.\n',
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
                onPressed: () => _getFromCamera(),
                label:Text('Scan een object'),
                icon: Icon(Icons.add_a_photo ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:navbar()// This trailing comma makes auto-formatting nicer for build methods.

    );
  }
}




