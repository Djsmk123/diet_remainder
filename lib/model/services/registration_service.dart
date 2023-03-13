import 'dart:async';
import 'dart:developer';
import 'package:path_provider/path_provider.dart';
import 'package:diet_remainder/model/user_model.dart';
import 'package:hive/hive.dart';

import '../../core/errors/failures.dart';
class UserServices{
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
      log(userModel.toJson().toString());
      userBox.put('user', userModel.toJson());
    }on Exception{
      throw const DatabaseFailure();
    }
  }
  Future<UserModel> getUser() async {
    try{
      final userBox = await openHiveBox('userBox');
      final userJson=userBox.get('user');

      return UserModel.fromJson(userJson);
    }catch(e){
      throw const DatabaseFailure();
    }
  }
  Future<bool> isAuth() async {
    try{
      final userBox = await openHiveBox('userBox');
      final userJson=userBox.get('user');
     return userJson??false;
    }catch(e){
      throw const DatabaseFailure();
    }
  }
  Future deleteAll() async {
    try{
      final userBox = await Hive.openBox('userBox',path: './');
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
      final userBox = await Hive.openBox('userBox');
      userBox.put('user', userModel.toJson());
    }on Exception{
      throw const DatabaseFailure();
    }
  }


}


