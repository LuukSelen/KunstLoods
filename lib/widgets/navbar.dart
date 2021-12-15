// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:project_c/main.dart';


class navbar extends StatefulWidget {
  const navbar({Key? key}) : super(key: key);

  @override
  _navbarState createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  final list=['/tour','/galerij','/favoriet'];
  _selectTab(int Route) {
    if(ModalRoute.of(context)?.settings.name=='/home'){
      Navigator.pushNamed(context, list[Route]);
    }
    else {
      Navigator.pop(context);
      Navigator.pushNamed(context, list[Route]);
    }
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(onTap: (index) => _selectTab(index),
      showSelectedLabels: false,showUnselectedLabels: false,type: BottomNavigationBarType.fixed, backgroundColor: CustomBlack,items: const <BottomNavigationBarItem>[
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

