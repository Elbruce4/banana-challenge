import 'package:bananachallenge/Api/logIn/index.dart';
import 'package:bananachallenge/toast/index.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

logInVerification (emailControler , passwordControler , formKey , context , loading) async {
  
  loading();
  if(emailControler.text != "" && passwordControler.text != "") {
    final form = formKey.currentState!;
      if(form.validate()){
        var response = await logIn(context, {
          "username" : emailControler.text,
          "password" : passwordControler.text
        });
        if(response is DioError) {
          showToast("Creedenciales incorrectas", "error", 2, context);
        } else {
          Navigator.pushNamed(context, "listOfProducts");
        }
      } 
  } else {
    showToast("Debes completar todos los campos para loguearte", "warning", 5, context);
  }
  loading();

}