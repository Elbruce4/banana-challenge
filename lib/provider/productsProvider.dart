import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Api/config.dart';
import '../Api/logIn/index.dart';
import '../toast/index.dart';

class ProductsProvider extends ChangeNotifier {

  Map _products = {};
  Map _product = {};
  String _noProduct = "";
  bool _loading = false;
  //para intentar lograr de cargar el loader en productDetail cree un nuevo booleano pero no resulto
  bool _specialLoading = true;

  Map get products =>  _products;
  Map get product =>  _product;
  String get noProduct => _noProduct;
  bool get loading => _loading;
  bool get specialLoading => _specialLoading;

  Future<void> getAllProducts(context) async {

    _loading = true;
    try {
      //Se decide invocar tres veces esta variable por que es más eficaz que crear una nueva función asyncrónica y llamarla
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
      //Se decide invocar tres veces esta variable por que es más eficaz que crear una nueva función asyncrónica y llamarla
      Dio dio = await getDio(context);
      var response = await dio.get('https://dummyjson.com/products/$id');
      _product = response.data;
      notifyListeners();
    } catch (e) {
      //return e;  
    }
    _specialLoading = false;
    notifyListeners();

  }

  Future<void> filterProductsByInput(context , input) async {
    
    _loading = true;
    notifyListeners();
    try {
      //Se decide invocar tres veces esta variable por que es más eficaz que crear una nueva función asyncrónica y llamarla
      Dio dio = await getDio(context);
      var response = await dio.get('https://dummyjson.com/products/search?q=$input');
      if(response.data["products"].isEmpty) {
        _noProduct = 'No se encontraron resultados para $input';
      } 
      _products = response.data;
      notifyListeners();
    } catch (e) {
      //return e;  
    }
    _loading = false;
    notifyListeners();

  }

}