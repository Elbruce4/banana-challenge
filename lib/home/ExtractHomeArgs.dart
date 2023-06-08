import 'package:bananachallenge/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/productsProvider.dart';

//CREO ESTE WIDGET PARA PODER PASARLE AL WIDGET HIJO LOS DATOS DEL PROVIDER. HAGO ESTO YA QUE EN EL INIT STATE NO TENGO ACCESO AL CONTEXT
class ExtractHomeArgs extends StatefulWidget {
  const ExtractHomeArgs({super.key});

  @override
  State<ExtractHomeArgs> createState() => _ExtractHomeArgsState();
}

class _ExtractHomeArgsState extends State<ExtractHomeArgs> {
  @override
  Widget build(BuildContext context) {
    
    final products = context.watch<ProductsProvider>().products;
    final noProducts = context.watch<ProductsProvider>().noProduct;
    final loading = context.watch<ProductsProvider>().loading;
    final getProducts = context.read<ProductsProvider>().getAllProducts;
    final filterProductsByInput = context.read<ProductsProvider>().filterProductsByInput;
    
    return Home(
      products     : products,
      getProducts  : getProducts,
      filterByName : filterProductsByInput,
      noProduct    : noProducts,
      loading      : loading
    );
  }
}