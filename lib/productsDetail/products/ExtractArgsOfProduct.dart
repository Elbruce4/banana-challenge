
import 'package:bananachallenge/productsDetail/products/productDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../provider/productsProvider.dart';

class ExtractArgsProduct extends StatefulWidget {
  const ExtractArgsProduct({super.key});

  @override
  State<ExtractArgsProduct> createState() => _ExtractArgsProductState();
}

class _ExtractArgsProductState extends State<ExtractArgsProduct> {
  @override
  Widget build(BuildContext context) {

    final arguments = ModalRoute.of(context)!.settings.arguments as num;
    final product = context.watch<ProductsProvider>().product;
    final loading = context.watch<ProductsProvider>().loading;
    final getOneProductById = context.read<ProductsProvider>().getOneProductById;

    return ProductDetail(
      id                : arguments,
      product           : product,
      getOneProductById : getOneProductById,
      loading           : loading
    );
  }
}