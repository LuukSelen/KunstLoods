// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/main.dart';
import 'favoriet.dart';
import 'package:project_c/widgets/navbar.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:project_c/main.dart';

class detail_pagina extends StatefulWidget {
  const detail_pagina({Key? key}) : super(key: key);

  @override
  _detail_paginaState createState() => _detail_paginaState();
}

class _detail_paginaState extends State<detail_pagina> {
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

                  leading: Icon(Icons.info),
                  title: Text('Informatie'),
                  subtitle: Text(globalartworkdesc),
                ),
                ListTile(
                  leading: Icon(Icons.brush),
                  title: Text('Artiest'),
                  subtitle: Text(globalartist),
                ),
                ListTile(
                    leading: Icon(Icons.date_range),
                    title: Text('Jaar'),
                    subtitle: Text('N/A'),
               ),
                // ListTiles++
              ],
            ),
          ),
        ],
      ),
        bottomNavigationBar:navbar()
    );
  }
}
