import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';
class GetStorageService extends GetxService {


  static final jwtToken = GetStorage('JWT');
  static final LoginStorage = GetStorage('LOGIN');
  static final UserId = GetStorage('USERID');


  String get jwToken => jwtToken.read('TOKEN') ?? "";
  set jwToken(String value) => jwtToken.write('TOKEN', value);


  bool get getisLoggedIn => LoginStorage.read('LOGGEDIN') ?? false;
  set setisLoggedIn(bool value) => LoginStorage.write('LOGGEDIN', value);

  String get getUserId => LoginStorage.read('USERID') ?? "";
  set setUserId(String value) => LoginStorage.write('USERID', value);

  bool get setup => LoginStorage.read('SETUP') ?? false;
  set setup(bool value) => LoginStorage.write('SETUP', value);

  void deleteLocation() {
    jwtToken.remove('TOKEN');
    print("DELETED");
  }


  Future<GetStorageService> initState() async {
    log("Storage class : ${jwToken}");
    await GetStorage.init('JWT');
    await GetStorage.init('LOGIN');
    return this;
  }



}