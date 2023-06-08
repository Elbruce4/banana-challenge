
import 'package:bananachallenge/sizes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';


class LoadingSpinner extends StatefulWidget {
  const LoadingSpinner({Key? key}) : super(key: key);

  @override
  State<LoadingSpinner> createState() => _LoadingSpinnerState();
}

class _LoadingSpinnerState extends State<LoadingSpinner> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: mediaHeight(context, 1),
        child: Center(
          child: Image.asset(
            "assets/gif/loading.gif",
            fit: BoxFit.fill,
          )
        ),
      ),
    );
  }
}