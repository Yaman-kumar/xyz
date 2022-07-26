import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:xyz/app/modules/sign_up/controllers/sign_up_controller.dart';
import 'package:http/http.dart' as http;
import 'package:xyz/services/storage.dart';
import 'package:xyz/services/utils.dart';
class ApiCall{
  SignUpController signUpController = Get.find<SignUpController>();
  final FirebaseAuth Aauth = FirebaseAuth.instance;
  Future<dynamic> fetchDataWithoutHeader(String endPoint) async {

    final url=prod + endPoint;
    final response = await http
        .get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var value=jsonDecode(response.body);
      //userdetails.value=userDeteails.fromJson(value);

      return value;
      // return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('status code is ${response.statusCode}');
    }
  }
  Future<dynamic> fetchDataWithHeader(String endPoint) async {
String token=await Get.find<GetStorageService>().jwToken;
    final url=prod + endPoint;
    var headers={
     /* HttpHeaders.contentTypeHeader:'application/json',
      HttpHeaders.authorizationHeader:'${Get.find<GetStorageService>().jwToken}'*/
      "accept":"application/json",
      "token":token

    };
    print(headers);
    final response = await http
        .get(Uri.parse(url),headers: headers);

    if (response.statusCode == 200) {
      print("data ;;;;;;");
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var value=jsonDecode(response.body);
      //userdetails.value=userDeteails.fromJson(value);

      return value;
      // return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('status code is ${response.statusCode}');
    }
  }

  Future<dynamic> postDataWithHeaderandBody(String endPoint,var body) async {
    String token=await Get.find<GetStorageService>().jwToken;
    final url=prod + endPoint;
    var headers={
      "accept":"application/json",
      "token":token,
      'Content-Type': 'application/json',

    };

    print(headers);
    final response = await http
        .post(Uri.parse(url),headers: headers,body:body);

    if (response.statusCode == 200) {
      print("data ;;;;;;");
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var value=jsonDecode(response.body);
      //userdetails.value=userDeteails.fromJson(value);

      return 1;
      // return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('status code is ${response.statusCode}');
    }
  }

  Future<dynamic> postDataWithoutbody(String endPoint) async {
    String token=await Get.find<GetStorageService>().jwToken;
    final url=prod + endPoint;
    var headers={
      /* HttpHeaders.contentTypeHeader:'application/json',
      HttpHeaders.authorizationHeader:'${Get.find<GetStorageService>().jwToken}'*/
      "accept":"application/json",
      "token":token

    };
    print(headers);
    final response = await http
        .post(Uri.parse(url),headers: headers);

    if (response.statusCode == 200) {
      print("data ;;;;;;");
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var value=jsonDecode(response.body);
      //userdetails.value=userDeteails.fromJson(value);

      return value;
      // return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('status code is ${response.statusCode}');
    }
  }

  Future<dynamic> uploadImage(String path) async {
    String token=await Get.find<GetStorageService>().jwToken;
    var request = http.MultipartRequest('POST', Uri.parse('https://api.allayya.net/api/file-upload'));
    request.fields.addAll({
      'type': 'userImage'
    });
    var headers = {
      'accept': 'application/json',
      'token':token
    };
    request.files.add(await http.MultipartFile.fromPath('file', path));
    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
   // print(await response.stream.bytesToString());
   var value=await response.stream.bytesToString();
    print("statusssssss ::  ${value}");
   // var value=jsonDecode(response.);
    return jsonDecode(value);
    }
    else {
    print(response.reasonPhrase);
    }
  }

  Future<dynamic> patchDataWithHeaderandBody(String endPoint,var body) async {
    String token=await Get.find<GetStorageService>().jwToken;
    final url=prod + endPoint;
    var headers={
      "accept":"application/json",
      "token":token,
      'Content-Type': 'application/json',

    };

    print(headers);
    final response = await http
        .patch(Uri.parse(url),headers: headers,body:body);

    if (response.statusCode == 200) {
      print("data ;;;;;;");
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var value=jsonDecode(response.body);
      //userdetails.value=userDeteails.fromJson(value);

      return 1;
      // return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('status code is ${response.statusCode}');
    }
  }
}