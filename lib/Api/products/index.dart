import 'dart:convert';
import 'package:bananachallenge/Api/config.dart';
import 'package:dio/dio.dart';

getAllProducts (context) async {

  try {
    Dio dio = await getDio(context);
    var request = await dio.get("https://dummyjson.com/products");
    return request.data;
  } catch (e) {
    return e;
  }

}

getOneProductById (context , id) async {
  
  try {
    Dio dio = await getDio(context);
    var request = await dio.get('https://dummyjson.com/products/$id');
    return request.data;
  } catch (e) {
    return e;  
  }

}