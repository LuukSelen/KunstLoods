// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/widgets/navbar.dart';
import 'package:project_c/widgets/storage_service.dart';

class favoriet extends StatelessWidget {
  const favoriet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Storage storage = Storage();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text('Favorieten'),
      ),
      body: Center(
        child: 
          FutureBuilder(
            future: storage.downloadURL('IMG-1573.JPG'),//zoek voor deze filename
            builder: (BuildContext context,
                AsyncSnapshot<String> snapshot) {
                //check voor connectie met database
                if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  //upload image in app
                  return Container(
                    width: 300,
                    height: 250,
                    child: Image.network(snapshot.data!,
                    fit: BoxFit.cover,
                    ));
                } if (snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData) {
                  return CircularProgressIndicator();
                }
                return Container();
              }
            ),
        ),
        bottomNavigationBar: navbar(),
      );
  }
}

