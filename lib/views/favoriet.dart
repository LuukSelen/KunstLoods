// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/widgets/navbar.dart';
class favoriet extends StatelessWidget {
  const favoriet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text('Favorieten'),
      ),
      body: Center(
        child: Column(

        )

      ),
      bottomNavigationBar: navbar(),
    );
  }
}

