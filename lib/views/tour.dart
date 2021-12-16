// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/views/views.dart';
import 'package:project_c/widgets/widgets.dart';
import 'package:project_c/classes/custom_colors.dart';

class tour extends StatelessWidget {
  const tour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorCustombutton,
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

