// ignore_for_file: prefer_const_constructors
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:project_c/widgets/imageholder.dart';
import 'package:project_c/widgets/navbar.dart';



class galerij extends StatefulWidget {
  const galerij({Key? key}) : super(key: key);

  @override
  State<galerij> createState() => _galerijState();
}

class _galerijState extends State<galerij> {
  final Stream<QuerySnapshot> databaseart = FirebaseFirestore.instance.collection('loods_art').snapshots();

  @override
  Widget build(BuildContext context) {
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
                          child: imageholder(artdata.docs[index]['url'],artdata.docs[index]['name'],artdata.docs[index]['description'], artdata.docs[index]['artist']),
                        );
                      }
                      )
                  );
                }
      ),

      bottomNavigationBar: navbar(),
    );
  }

}

