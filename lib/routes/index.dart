

import 'package:bananachallenge/home/ExtractHomeArgs.dart';

import '../home/home.dart';
import '../productDetail/products/ExtractArgsOfProduct.dart';

getRoutes (context) {
  return {
    "listOfProducts" : (context) => const ExtractHomeArgs(),
    "productDetail" : (context) => const ExtractArgsProduct()
  };
}