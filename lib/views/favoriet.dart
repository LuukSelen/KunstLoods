// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/views/views.dart';
import 'package:project_c/widgets/widgets.dart';
import 'package:project_c/main.dart';
import 'package:project_c/classes/custom_colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class favoriet extends StatelessWidget {

  const favoriet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> databaseart;
    if (globalfavlist.length>0){
      databaseart = FirebaseFirestore.instance.collection('loods_art')
          .where('name', whereIn: globalfavlist)
          .snapshots();
    }
    else{
      databaseart=Stream.empty();
    }

      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorCustombutton,
          title: Text('Favorieten'),
        ) ,
        body: StreamBuilder<QuerySnapshot>(
            stream:databaseart,
            builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
              if (snapshot.hasError) {
                return Text('Helaas is er iets fout gegaan');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Aan het laden');
              }
              if (snapshot.hasData) {
                final artdata = snapshot.requireData;

                return GridView.count(
                    childAspectRatio: 3 / 2,
                    crossAxisCount: 1,
                    mainAxisSpacing: 1,
                    children: List.generate(artdata.size, (index) {
                      String artdataLowResImage = artdata.docs[index]['url'];
                      try {
                        artdataLowResImage = artdata.docs[index]['low_res_url'];
                      } on StateError catch (e) {}
                      return Center(
                        child: imageholder(
                            artdataLowResImage, artdata.docs[index]['name'],
                            artdata.docs[index]['description'],
                            artdata.docs[index]['artist'],
                            artdata.docs[index]['youtubeurl']),
                      );
                    }
                    )
                );
              }
              else{
                return Container(
                  child:Center(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  <Widget>[
                        Image(
                          image: AssetImage('assets/logo.png'),
                          // height:230,
                          // fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            'U heeft nog geen favorieten.',
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
            }

        ),

        bottomNavigationBar: navbar(),
      );
    }
  }

