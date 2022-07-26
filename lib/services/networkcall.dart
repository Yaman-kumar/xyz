import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:xyz/services/utils.dart';

class HttpClient{
  final storage = new FlutterSecureStorage();
  static final HttpClient _singleton = HttpClient();
  static HttpClient get instance => _singleton;



  Future<List<dynamic>>fetchData(String url, {Map<String, String>?params})async{
    var jwt = await storage.read(key: "jwt");
    var responseJson;
    var uri = prod + url + ((params != null) ? this.queryParameters(params): "");
    var headers={
      HttpHeaders.contentTypeHeader:'application/json',
      HttpHeaders.authorizationHeader:"Bearer $jwt"
    };

    // final header = {
    //   "Content-type": "application/json",
    //   "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjgsImlhdCI6MTYzNjQzNDk2OCwiZXhwIjoxNjM5MDI2OTY4fQ.p7jCQ-7pTA3uZTV4FUHvdGwDbYAwKLepPw_HyLR-IZM",
    // };
    try {
      final response = await http.get(Uri.parse(uri),headers: headers);
      responseJson = _returnResponse(response);
    }on SocketException{
    //  throw FetchDataException("Please Check Your Internet Connection");
    }
    return responseJson;

  }
  Future<dynamic>fetchDatA(String url, {Map<String, String>?params})async{

    var jwt = await storage.read(key: "jwt");
    print(jwt);
    var responseJson;
    var uri = prod + url + ((params != null) ? this.queryParameters(params): "");
    var headers={
      HttpHeaders.contentTypeHeader:'application/json',
      HttpHeaders.authorizationHeader:"Bearer $jwt"
    };

    // final header = {
    //   "Content-type": "application/json",
    //   "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NjgsImlhdCI6MTYzNjQzNDk2OCwiZXhwIjoxNjM5MDI2OTY4fQ.p7jCQ-7pTA3uZTV4FUHvdGwDbYAwKLepPw_HyLR-IZM",
    // };
    try {
      final response = await http.get(Uri.parse(uri),headers: headers);
      responseJson = _returnResponse(response);
    }on SocketException{
     // throw FetchDataException("Please Check Your Internet Connection");
    }
    return responseJson;

  }


  String queryParameters(Map<String,String> params){
    if(params != null){
      final jsonString = Uri(queryParameters: params);
      return "?${jsonString.query}";
    }
    return '';
  }




  Future<List<dynamic>> postData(String url,String text)async{
    var jwt = await storage.read(key: "jwt");
    var responseJson;
    var uri = prod + url;
    var headers={
      HttpHeaders.contentTypeHeader:'application/json',
      'Authorization':'Bearer $jwt'
    };
    final score = '$text';
    try{

      final response = await http.post(Uri.parse(uri), body: score, headers : headers);
      responseJson = _returnResponse(response);
      print(response.body);

    }on SocketException{

     // throw FetchDataException('No Internet Connection');

    }
    return responseJson;
  }



  dynamic _returnResponse(http.Response response){
    switch(response.statusCode){
      case 200:
        var responseJson = json.decode(response.body);
        return responseJson;
      case 400:
       // throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        //throw BadRequestException(response.body.toString());
      case 500:
      default:
      //  throw FetchDataException("Error Occured while Communication: ${response.statusCode}");

    }
  }
}