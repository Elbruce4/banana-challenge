import 'package:bananachallenge/Api/products/index.dart';
import 'package:bananachallenge/home/products/productCard.dart';
import 'package:bananachallenge/loading/index.dart';
import 'package:bananachallenge/provider/productsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../inputs/serachInput.dart';

class Home extends StatefulWidget {

  Map products;
  Function getProducts;
  Function filterByName;
  String noProduct;
  bool loading;

  Home({
    required this.products,
    required this.getProducts,
    required this.filterByName,
    required this.noProduct,
    required this.loading
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //var data;
  //bool loading = false;

  getData () async {
/*     setState(() {
      loading = true;
    }); */
    await widget.getProducts(context);
/*     setState(() {
      loading = false;
    }); */
  }

/*   changeLoader () {
    print("Entra a la func00");

      loading = !loading;

    print("Entra a la func01");
  } */

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter challenge 2023"),
        automaticallyImplyLeading: false,
      ),
      body: 
      widget.loading ?
      LoadingSpinner()
      : SingleChildScrollView(
        
        child: widget.products["products"] == null || widget.products["products"].isEmpty ?
        Column(
          children: [
            SearchInput(
              filter : widget.filterByName,
            ),
            Text(
              widget.noProduct
            )
            //ProductCard()
          ],
        )
        :
        Column(
          children: [
            SearchInput(
              filter: widget.filterByName,
            ),
            
            for(var i = 0; i < widget.products["products"].length; i++)
            ProductCard(
                title: widget.products["products"][i]["title"], 
                description: widget.products["products"][i]["description"], 
                brand: widget.products["products"][i]["brand"], 
                price: widget.products["products"][i]["price"], 
                stock: widget.products["products"][i]["stock"],
                id: widget.products["products"][i]["id"],
                images: widget.products["products"][i]["images"]
              )
            //ProductCard()
          ],
        ),
      )
    );
  }
}