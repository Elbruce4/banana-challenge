
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Api/config.dart';
import '../Api/logIn/index.dart';
import '../toast/index.dart';
import 'package:flutter/cupertino.dart';

class LogInProvider extends ChangeNotifier {
  
  bool _loading = false;
  
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
}