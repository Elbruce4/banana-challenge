import 'package:bananachallenge/sizes/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductCard extends StatefulWidget {

  String title;
  String description;
  String brand;
  num price;
  num stock;
  List<dynamic> images;
  num id;

  ProductCard({
    required this.title,
    required this.description,
    required this.brand,
    required this.price,
    required this.stock,
    required this.images,
    required this.id
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "productDetail" , arguments: widget.id);
      },
      child: Container(
          width: mediaWidth(context, 0.9),
          height: mediaHeight(context, 0.25),
          margin: EdgeInsets.all(mediaWidth(context, 0.05)),
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10.0,
                spreadRadius: -20.0,
                offset: Offset(-15, 15),
              )
            ],
            border: Border.all(
              width: mediaWidth(context , 0.002),
              color: Color.fromARGB(255, 0, 0, 0)
            ),
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: mediaWidth(context, 0.015),
                  right: mediaWidth(context, 0.015)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: mediaWidth(context, 0.62),
                      child: Text(
                        widget.title.length > 20 ? "${widget.title.substring(0,15)}..." : widget.title,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: mediaWidth(context, 0.05)
                        ),
                      ),
                    ),
                    Text(
                      'USD ${widget.price.toString()}',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: mediaWidth(context, 0.04)
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: mediaWidth(context, 0.015),
                  right: mediaWidth(context, 0.015),
                  bottom: mediaWidth(context, 0.015)
                ),
                height: mediaHeight(context, 0.21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.brand,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: mediaWidth(context, 0.04)
                      ),
                      
                    ),
                    Text(
                      widget.description.length > 60 ? "${widget.description.substring(0,60)}..." : widget.description,
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: mediaWidth(context, 0.04)
                      ),
                    ),
                    Text(
                      'Stock: ${widget.stock.toString()}',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: mediaWidth(context, 0.04)
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }
}