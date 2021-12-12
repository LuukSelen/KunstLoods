// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_c/widgets/imageholder.dart';
import 'package:project_c/widgets/navbar.dart';
import 'package:project_c/classes/artwork.dart';


class galerij extends StatefulWidget {
  const galerij({Key? key}) : super(key: key);

  @override
  State<galerij> createState() => _galerijState();
}

class _galerijState extends State<galerij> {
  int _counter = 0;
    final Stream<QuerySnapshot> databaseart = FirebaseFirestore.instance.collection('loods_art').snapshots();
    final List<Artworks> artworks=<Artworks>[
    new Artworks('assets/sample_art.jpg','Hier komt de informatie over de prachtige kunstwerken.','Mooi Kunstwerk'),
    new Artworks('assets/monalisa.jpeg', 'De Mona Lisa! Te vinden in Parijs.', 'Mona Lisa'),
    new Artworks('assets/vrouw.jpg', 'Wanneer je die jonko flink op zn flikker geeft', 'Realiteit'),
    ];
  @override
  Widget build(BuildContext context) {
    final Artworksmap= artworks.asMap();
    int count= Artworksmap.length;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text('Cavero Loods Tour'),
      ) ,
      body: StreamBuilder<QuerySnapshot>(
          stream:databaseart,
          builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
              ){
                  if (snapshot.hasError){
                    return Text('Helaas is er iets fout gegaan');
                  }
                  if (snapshot.connectionState== ConnectionState.waiting){
                    return Text('Aan het laden');
                  }
                  final artdata = snapshot.requireData;
                  return GridView.count(
                    childAspectRatio: 3/2,
                    crossAxisCount: 1,
                    mainAxisSpacing: 1,
                      children: List.generate( artdata.size, (index){
                        return Center(
                          child: imageholder(artdata.docs[index]['url'],artdata.docs[index]['name'],artdata.docs[index]['description']),
                        );
                      }
                      )
                  );
                }
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

