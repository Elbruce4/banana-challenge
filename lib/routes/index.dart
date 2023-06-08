

import 'package:bananachallenge/home/ExtractHomeArgs.dart';
import 'package:bananachallenge/home/products/productDetail.dart';

import '../home/home.dart';
import '../home/products/ExtractArgsOfProduct.dart';

getRoutes (context) {
  return {
    "listOfProducts" : (context) => const ExtractHomeArgs(),
    "productDetail" : (context) => const ExtractArgsProduct()
  };
}