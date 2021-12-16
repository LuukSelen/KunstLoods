// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_c/main.dart';
import 'package:project_c/classes/custom_colors.dart';
import 'package:project_c/views/views.dart';
import 'package:project_c/widgets/widgets.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class detail_pagina extends StatefulWidget {
  const detail_pagina({Key? key}) : super(key: key);

  @override
  _detail_paginaState createState() => _detail_paginaState();
}

class _detail_paginaState extends State<detail_pagina> {

  bool _isFavorited = globalfavlist.contains(globalartworkname);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(

        physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          SliverAppBar(
            stretch: true,
            onStretchTrigger: () {
              // Function callback for stretch
              return Future<void>.value();
            },
            expandedHeight: 400.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const <StretchMode>[
                StretchMode.zoomBackground,
                // StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              centerTitle: true,
              title: Text(globalartworkname),
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image(
                    image: globaladres != 'noImage'
                        ? NetworkImage(globaladres)
                        : AssetImage('assets/images/noImageAvailable.png') as ImageProvider,
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 1),
                        end: Alignment.center,
                        colors: <Color>[
                          Color(0xFF214249),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
               <Widget>[
                  ListTile(
                    leading: Icon(Icons.info, color: HexColor('#FFFFFF'),),
                    title: Text('Informatie', style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(globalartworkdesc),
                    textColor: HexColor('#FFFFFF'),
                  ),
                  ListTile(
                    leading: Icon(Icons.brush, color: HexColor('#FFFFFF'),),
                    title: Text('Artiest', style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text(globalartist),
                    textColor: HexColor('#FFFFFF'),
                  ),
                 ListTile(
                    leading: Icon(Icons.date_range, color: HexColor('#FFFFFF'),),
                    title: Text('Jaar', style: TextStyle(fontWeight: FontWeight.bold),),
                    subtitle: Text('N/A'),
                    textColor: HexColor('#FFFFFF'),
               ),
                 IconButton(
                   icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
                   iconSize: 30,
                   color: colorCustombutton,
                   onPressed: () {
                     setState(() {
                       _isFavorited = !_isFavorited;
                       if (_isFavorited){
                         const snackBar = SnackBar(duration: const Duration(milliseconds: 600), content: Text('Favoriet opgeslagen'));
                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                         globalfavlist.add(globalartworkname);
                         print(globalfavlist);
                       } else {
                         const snackBar = SnackBar(duration: const Duration(milliseconds: 600), content: Text('Favoriet verwijderd'));
                         ScaffoldMessenger.of(context).showSnackBar(snackBar);
                         globalfavlist.removeWhere((item) => item == globalartworkname);
                         print(globalfavlist);
                       }

                     });
                   },
                 ), // ListTiles++
              ],
            ),
          ),

        ],
      ),
        bottomNavigationBar:navbar()
    );
  }
}
