// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_c/widgets/navbar.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../storage_service.dart';

class galerij extends StatefulWidget {
  const galerij({Key? key}) : super(key: key);

  @override
  State<galerij> createState() => _galerijState();
}

class _galerijState extends State<galerij> {
  int _counter = 0;
  final database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    final Storage storage= Storage();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text('galerij'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder(
                  future: storage.listFiles(),
                  builder: (BuildContext context, AsyncSnapshot<firebase_storage.ListResult> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done
                        && snapshot.hasData) {
                      //return Container(
                       // padding: const EdgeInsets.symmetric(horizontal: 20),
                       // height: 50,child:
                        return Container(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          height: 200,
                          //width: 250,
                          color: Colors.red,
                          child: ListView.builder(
                              padding: const EdgeInsets.all(8),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data!.items.length,
                              itemBuilder: (BuildContext context, int index){

                                return ElevatedButton(
                                  /*style: ElevatedButton.styleFrom(
                                    maximumSize: Size(10,10),
                                  ),*/
                                  onPressed: () {},
                                  child: Text(snapshot.data!.items[index].name),
                            );

                      }),
                        );
                      //);
                    }
                    if (snapshot.connectionState == ConnectionState.waiting||
                      !snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    return Container();
                  }),
              FutureBuilder(
                  future: storage.downloadURL('IMG-1573.JPG'),
                  builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done
                        && snapshot.hasData) {
                      return Container(width: 300, height: 250,
                      child: Image.network(snapshot.data!,
                          fit: BoxFit.cover
                      ));
                    }
                    if (snapshot.connectionState == ConnectionState.waiting||
                        !snapshot.hasData){
                      return CircularProgressIndicator();
                    }
                    return Container();
                  }
                )
              ],
          )
      ),
        bottomNavigationBar: navbar(),
    );
  }
  void _incrementCounter() {
    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("test");
    _testRef.set("Hello World ${Random().nextInt(100)}");

    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }
}

