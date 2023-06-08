import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../sizes/index.dart';

class AccessInputs extends StatefulWidget {

  String label;
  var controler;
  Function validate;
  bool password;

  AccessInputs({
    required this.label,
    required this.controler,
    required this.validate,
    required this.password
  });

  @override
  State<AccessInputs> createState() => _AccessInputsState();
}

class _AccessInputsState extends State<AccessInputs> {

  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return  
      SizedBox(
        child: TextFormField(
          obscureText: widget.password ? isPasswordVisible : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (data) => widget.validate(data),
          initialValue: null,
          controller: widget.controler,
          enabled: true,
          keyboardType: TextInputType.text,
          style: TextStyle(
            decoration: TextDecoration.none, 
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: "Exo",
            fontSize: mediaWidth(context, 0.04),
          ),
          decoration: InputDecoration(
            labelText: widget.label,
            focusColor: Colors.grey,
            errorStyle: TextStyle(
              color:  Color(0xFF9E007E),
              fontSize: mediaWidth(context, 0.03)
            ),
            suffixIcon: widget.password ? IconButton(
              icon: isPasswordVisible ?
              const Icon(
                Icons.visibility_off,
                color: Color(0xFF9E007E)
              )
              :
              const Icon(
                Icons.visibility,
                color: Color(0xFF9E007E)
              ),
              onPressed: () => setState(() {
                isPasswordVisible = !isPasswordVisible;
              }),
            ) : null,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: mediaWidth(context, 0.002),
                color: Color.fromARGB(255, 235, 234, 234)
              )
            )
          ),
          
        ),
      );
  }
}