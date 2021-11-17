// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';



class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  _navbarState createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  final list=['/tour','/galerij','/favoriet'];
  _selectTab(int Route) {
   Navigator.pushNamed(context, list[Route]);

  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: (index) => _selectTab(index),
      showSelectedLabels: false,showUnselectedLabels: false,type: BottomNavigationBarType.fixed, backgroundColor: Colors.green,items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Icon(Icons.add_location,color: Colors.white,size:30),
          label: 'Tour'),
      BottomNavigationBarItem(
          icon: Icon(Icons.photo,color: Colors.white,size:30),
          label: 'Gallerij'),
      BottomNavigationBarItem(
          icon: Icon(Icons.favorite,color: Colors.white,size:30),
          label: '/favorieten'),
    ],

    );
  }
}

