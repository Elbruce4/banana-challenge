
import 'dart:convert';
import 'package:bananachallenge/Api/config.dart';
import 'package:dio/dio.dart';

logIn (context , data) async {

  try {
    Dio dio = await getDio(context);
    var request = await dio.post("https://dummyjson.com/auth/login",
      data: jsonEncode(data),
    );
    return request.data;
  } catch (e) {
    return e;
  }
  
}