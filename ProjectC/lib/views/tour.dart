// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/widgets/navbar.dart';
class tour extends StatelessWidget {
  const tour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: Text('Tour'),
      ),
      body: Center(
          child: Column(

          )

      ),
      bottomNavigationBar: navbar(),
    );
  }
}

