import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Api/config.dart';

class ProductsProvider extends ChangeNotifier {

  Map _products = {};
  Map _product = {};
  String _noProduct = "";
  bool _loading = false;

  Map get products =>  _products;
  Map get product =>  _product;
  String get noProduct => _noProduct;
  bool get loading => _loading;

  Future<void> getAllProducts(context) async {

    _loading = true;
    try {
      Dio dio = await getDio(context);
      var response = await dio.get("https://dummyjson.com/products");
      _products = response.data;
    } catch (e) {
      //return e;
    }
    _loading = false;
    notifyListeners();

  }

  Future<void> getOneProductById(context , id) async {
  
  
    try {
      Dio dio = await getDio(context);
      var response = await dio.get('https://dummyjson.com/products/$id');
      _product = response.data;
      notifyListeners();
    } catch (e) {
      //return e;  
    }

  }

  Future<void> filterProductsByInput(context , input) async {
    
    _loading = true;
    notifyListeners();
    try {
      Dio dio = await getDio(context);
      var response = await dio.get('https://dummyjson.com/products/search?q=$input');
      print(response.data["products"]);
      if(response.data["products"].isEmpty) {
        print("Entro acá");
        _noProduct = 'No se encontraron resultados para $input';
        _products = response.data;
      } else {
        print("fue al otro lado");
        _products = response.data;
      }
      notifyListeners();
    } catch (e) {
      //return e;  
    }
    _loading = false;
    notifyListeners();

  }

}