import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:motion_toast/motion_toast.dart';

showToast(message , type , seconds , context) {
  switch(type){
    case "warning":
    MotionToast.warning(
      width: 300,
      height: 100,
      toastDuration: Duration(seconds: seconds == null ? 1 : seconds),
      description: Text(message,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Exo",
            fontSize: 15
          )),
      ).show(context);
      break;
    case "success":
    MotionToast.success(
      width: 300,
      height: 100,
      toastDuration: Duration(seconds: seconds == null ? 1 : seconds),
      description: Text(message,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Exo",
            fontSize: 20
          )),
      ).show(context);
      break;
    default :
    MotionToast.error(
      width: 300,
      height: 100,
      toastDuration: Duration(seconds: seconds == null ? 1 : seconds),
      description: Text(message,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: "Exo",
            fontSize: 15
          )),
      ).show(context);
      break;
  }
}