// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'favoriet.dart';
import 'Camera.dart';
import 'package:project_c/widgets/navbar.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {

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
            children: const <Widget>[
              Image(
                  image: AssetImage('assets/logo.png')
              ),
              SizedBox(
                width: 300,
                child: Text(
                  'Welkom bij de Cavero Loods tour. Op onze locaties zijn er meerde plekken die interessant kunnen zijn. Wilt u kijken of er meer informatie is over een bepaalde plek? Dan kunt u gebruik maken van de camera om een scan te maken. Als er een match is zult u meer informatie krijgen.\n\n\n\n\n\n\n\nBegin met scannen door op de onderstaande knop te klikken.\n',
                  textAlign: TextAlign.center,
                ),
              ),
              FloatingActionButton.extended(
                elevation: 5,
                onPressed: null,
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




