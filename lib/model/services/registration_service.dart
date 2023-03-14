import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:diet_remainder/model/user_model.dart';
import 'package:hive/hive.dart';

import '../../core/converter.dart';
import '../../core/errors/failures.dart';
class UserServices with Parsers{
  Future<Box> openHiveBox(String boxName)async{
    if(!Hive.isBoxOpen(boxName)) {
      final documentDirectory = await getApplicationDocumentsDirectory();
      Hive.init(documentDirectory.path);
    }
      final userBox = await Hive.openBox(boxName);
      return userBox;
  }
  Future<void> registerUser(UserModel userModel) async {
    try{
      final userBox = await openHiveBox('userBox');
      userBox.put('user', (userModel.toJson()));
    }on Exception{
      throw const DatabaseFailure();
    }
  }
  Future<UserModel?> getUser() async {
    try{
      final userBox = await openHiveBox('userBox');
      final result = userBox.get('user');
      return UserModel.fromJson(toJSon(result));
    }catch(e){
      log(e.toString());
      throw const DatabaseFailure();
    }
  }
  Future deleteAll() async {
    try{
      final userBox = await openHiveBox('userBox');
      userBox.deleteFromDisk();
    }catch(e){
      throw const DatabaseFailure();
    }
  }
  Future backup() async {
    try{
      //TODO: backup
    }on Exception{
      throw const DatabaseFailure();
    }
  }
  Future restore() async {
    try {
      //TODO: restore
    }
    on Exception {
      throw const DatabaseFailure();
    }
  }
  Future update(UserModel userModel) async {
    try{
     final userBox = await openHiveBox('userBox');
      userBox.put('user', userModel.toJson());
    }on Exception{
      throw const DatabaseFailure();
    }
  }


}


