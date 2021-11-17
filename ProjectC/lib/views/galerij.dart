// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/widgets/navbar.dart';
class galerij extends StatelessWidget {
  const galerij({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text('galerij'),
      ),
      body: Center(
          child: Column(

          )

      ),
      bottomNavigationBar: navbar(),
    );
  }
}

