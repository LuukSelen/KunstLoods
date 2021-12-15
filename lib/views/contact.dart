// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/widgets/navbar.dart';
import 'package:project_c/main.dart';

class contact extends StatelessWidget {
  const contact({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorCustombutton,
        title: Text('Contact'),
      ),
      body: Center(
          child: Column(

          )

      ),
      bottomNavigationBar: navbar(),
    );
  }
}

