// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
class Artworks{
   late String url;
   late String description;
   late String name;

   Artworks(String Url, String Description, String Name ){
     this.url=Url;
     this.description=Description;
     this.name=Name;
   }

}