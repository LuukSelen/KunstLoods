import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';
import 'package:project_c/main.dart';
void erase () async{
  await GetStorage.init();
  final box = GetStorage();
  box.erase();
}
Future<dynamic> getlist() async{
  await GetStorage.init();
  final box = GetStorage();
  return box.read('list') ?? [''];
}

void savelist(List<dynamic> list) async{
  await GetStorage.init();
  final box = GetStorage();
  box.write('list',list);
}
