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

  Map get products =>  _products;
  Map get product =>  _product;
  String get noProduct => _noProduct;
  bool get loading => _loading;


logInVerification (emailControler , passwordControler , formKey , context ) async {
  
  _loading = true;
  notifyListeners();
  if(emailControler.text != "" && passwordControler.text != "") {
    final form = formKey.currentState!;
      if(form.validate()){
        var response = await logIn(context, {
          "username" : emailControler.text,
          "password" : passwordControler.text
        });
        if(response is DioException) {
          showToast("Creedenciales incorrectas", "error", 2, context);
        } else {
          Navigator.pushNamed(context, "listOfProducts");
        }
      } 
  } else {
    showToast("Debes completar todos los campos para loguearte", "warning", 2, context);
  }
  _loading = false;
  notifyListeners();

}

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