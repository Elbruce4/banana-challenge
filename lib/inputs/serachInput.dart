import 'package:bananachallenge/sizes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SearchInput extends StatefulWidget {

  Function filter;

  SearchInput({
    required this.filter,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(mediaWidth(context, 0.05)),
      child: TextFormField(
        onFieldSubmitted: (strings) {
          widget.filter(context , strings);
        },
        keyboardType: TextInputType.text,
        style: TextStyle(
          decoration: TextDecoration.none, 
          color: Color.fromARGB(255, 0, 0, 0),
          fontFamily: "Exo",
          fontSize: mediaWidth(context, 0.04),
        ),
        decoration: InputDecoration(
          labelText: "Buscar producto",
          suffixIcon: IconButton(
            icon: Icon(
                Icons.search_outlined  ,
                color: Colors.black,
              ),
            onPressed: () {  },
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: mediaWidth(context, 0.002),
                color: Color.fromARGB(255, 143, 142, 142)
              )
            )
        ),
      ),
    );
  }
}