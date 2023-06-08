import 'package:bananachallenge/logIn/validations.dart';
import 'package:bananachallenge/sizes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../inputs/accessInputs.dart';
import 'logInAccess.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  
  final emailControler = TextEditingController();
  final passwordControler = TextEditingController();
  //Validator of data on the form
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool loadingCreedentials = false;

  

  @override
  Widget build(BuildContext context) {

    changeLoader () {
      setState(() {
        loadingCreedentials = !loadingCreedentials;
      });
    }
    final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      
      body: Container(
        margin: EdgeInsets.only(
          top: isKeyBoard ? mediaWidth(context, 0.4) : mediaWidth(context, 0.3)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: isKeyBoard ? mediaWidth(context, 0.3) : 0
              ),
              child: Text(
                "Bienvenido!",
                style: TextStyle(
                  fontSize: mediaWidth(context, 0.1)
                ),
              )
            ),
              Container(
                height: mediaHeight(context, 0.3),
                margin: EdgeInsets.only(
                  top: isKeyBoard ? mediaWidth(context, 0.4) : mediaWidth(context, 0.2),
                  left: mediaWidth(context, 0.05),
                  right: mediaWidth(context, 0.05)
                ),
                child: Form(
                  
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AccessInputs(
                        label: "Usuario" , 
                        controler: emailControler,
                        validate: (e) {},
                        password: false,
                      ),
                      AccessInputs(
                        label: "Contraseña" , 
                        controler: passwordControler,
                        validate: (e) {},
                        password: true
                      ),
                      SizedBox(
                        width: mediaWidth(context, 0.95),
                        child: ElevatedButton(
                          onPressed: () {
                            logInVerification (emailControler , passwordControler , formKey , context , changeLoader);
                          }, 
                          child: loadingCreedentials ? 
                          const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                            
                          ) : const Text("Ingresar")
                        ),
                      )
                    ],
                  ),
                ),
              
            )
          ],
        ),
      ),
    );
  }
}