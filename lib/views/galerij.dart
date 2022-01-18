// ignore_for_file: prefer_const_constructors
// import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:project_c/views/views.dart';
import 'package:project_c/widgets/widgets.dart';
import 'package:project_c/classes/custom_colors.dart';



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
        backgroundColor: colorCustombutton,
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
                    return Container(
                      child:Center(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  <Widget>[
                            Image(
                              image: AssetImage('assets/logo.png'),
                            ),
                            SizedBox(
                              width: 300,
                              child: Text(
                                'Aan het laden...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  final artdata = snapshot.requireData;
                  return GridView.count(
                    childAspectRatio: 3/2,
                    crossAxisCount: 1,
                    mainAxisSpacing: 1,
                      children: List.generate( artdata.size, (index){
                        String artdataLowResImage = artdata.docs[index]['url'];
                        try {
                          artdataLowResImage = artdata.docs[index]['low_res_url'];
                        } on StateError catch(e) {}
                        return Center(
                          child: imageholder(artdataLowResImage ,artdata.docs[index]['name'],artdata.docs[index]['description'], artdata.docs[index]['artist'],artdata.docs[index]['youtubeurl']),
                        );

                      }
                      ),
                  );
                }
      ),

      bottomNavigationBar: navbar(),
    );
  }

}

