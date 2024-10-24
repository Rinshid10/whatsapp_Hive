import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:whatsapp/modal/modalForThis.dart';

ValueNotifier<List<whatsapp>> whatsappListener = ValueNotifier([]);
Future addUser(whatsapp value) async {
  final whatDb = await Hive.openBox<whatsapp>('save_data');
  whatDb.add(value);
  whatsappListener.value.add(value);
  whatsappListener.notifyListeners();
  log(whatDb.name);
}

Future viewAlluser() async {
  final whatDb = await Hive.openBox<whatsapp>('save_data');
  whatsappListener.value.clear();
  whatsappListener.value.addAll(whatDb.values);
  whatsappListener.notifyListeners();
}

Future deleteUser(int index) async {
  final whatDb = await Hive.openBox<whatsapp>('save_data');
  whatDb.deleteAt(index);
  viewAlluser();
}

Future editUser(index, whatsapp value) async {
  final whatDb = await Hive.openBox<whatsapp>('save_data');
  whatsappListener.value.clear();
  whatsappListener.value.addAll(whatDb.values);
  whatsappListener.notifyListeners();
  whatDb.putAt(index, value);
  viewAlluser();
}
