
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../Api/logIn/index.dart';
import '../toast/index.dart';

logInVerification (emailControler , passwordControler , formKey , context , loading ) async {
  
  loading = true;
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
  loading = false;

}