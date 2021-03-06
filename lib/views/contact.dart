// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/views/views.dart';
import 'package:project_c/widgets/widgets.dart';
import 'package:project_c/classes/custom_colors.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/youtube.dart';

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorCustombutton,
        title: Text('Contact informatie'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children:<Widget>[
              Image.asset(
                'assets/loods_entry.jpg',
                height:225,
                width:5000,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height:10,
              ),
              ListTile(
                leading: Icon(Icons.location_on, color: HexColor('#FFFFFF'),),
                title: Text('Adres', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('Treubstraat 31\n2288 EH Rijswijk'),
                textColor: HexColor('#FFFFFF'),
              ),
              ListTile(
                leading: Icon(Icons.local_phone, color: HexColor('#FFFFFF'),),
                title: Text('Telefoonnummer', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('+31(0)6 236 79 220'),
                textColor: HexColor('#FFFFFF'),
              ),
              ListTile(
                leading: Icon(Icons.mail_outline, color: HexColor('#FFFFFF'),),
                title: Text('Mail', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('info@dekennisloods.nl'),
                textColor: HexColor('#FFFFFF'),
              ),
              ListTile(
                leading: Icon(Icons.public, color: HexColor('#FFFFFF'),),
                title: Text('Website', style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('dekennisloods.nl'),
                onTap: () => launch('https://dekennisloods.nl/'),
                textColor: HexColor('#FFFFFF'),
              ),

              // Row(
              //   children: <Widget>[
              //     Text('Social Media', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              //   ]
              // ),
            ],
          ),

        ),
      ),
      bottomNavigationBar:navbar()
    );
  }
}

