/* 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

ACLARACIÓN ESTE WIDGET NO LOGRE LO BUSCADO. INSERTAR EL LOADER PARA QUE TRAIGA LOS NUEVOS DATOS DE LA API Y MUESTRE LA PANTALLA DE CARGA.
ES POR ESO QUE DEJA EL ESTADO ANTERIOR Y SE VE. NO PUDE REALIZARLO CON EL LOADER DEL PROVIDER COMO EN LOS OTROS WIDGETS
POR QUE ME LANZABA ERROR DE QUE ESTABA LLAMANDO A UN SET STATE EN UN MOMENTO INCORRECTO (POR ESO CREE UN ESPECIAL LOADER EN PROVIDER). 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

 */

import 'package:bananachallenge/loading/index.dart';
import 'package:bananachallenge/sizes/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'getProduct.dart';



class ProductDetail extends StatefulWidget {

  num id;
  Map product;
  Function getOneProductById;
  bool loading;

  ProductDetail({
    required this.product,
    required this.getOneProductById,
    required this.id,
    required this.loading
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {



  @override
  void initState() {
    super.initState();
    getProduct(widget.getOneProductById , context , widget.id);


  }

  @override
  Widget build(BuildContext context) {
    
    return widget.loading ? LoadingSpinner() : Scaffold(
      appBar: AppBar(
        title: Text(widget.product["title"]),
      ),
      body: SizedBox(
          height: mediaHeight(context, 0.89),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      
                      children: [
                        for( var i = 0; i < widget.product["images"].length; i++)
                          SizedBox(
                            child: Image.network(
                              widget.product["images"][i],
                              scale: mediaWidth(context, 0.005),
                              height: mediaHeight(context, 0.3),
                              fit: BoxFit.contain,
                              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                return child;
                                },
                                loadingBuilder:(context, child, loadingProgress) {
                                  if (loadingProgress != null) {
                                    return CircularProgressIndicator(
                                      value: loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!);
                                  }
                                  return child;
                                }
                            ) 
                          )
                      ],
                    ),
                  ),
                  Container(
                    height: mediaHeight(context, 0.15),
                    margin: EdgeInsets.only(
                      right: mediaWidth(context, 0.08)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: mediaWidth(context, 0.8),
                          child: Text(
                            widget.product["description"],
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontSize: mediaWidth(context, 0.04)
                            ),
                          ),
                        ),
                        SizedBox(
                          width: mediaWidth(context, 0.8),
                          child: Text(
                            "USD${widget.product["price"].toString()}",
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: mediaWidth(context, 0.04)
                            ),
                          ),
                        )
                      ],
                                ),
                  ),
                ]
              ),
              
              Container(
                margin: EdgeInsets.all(mediaWidth(context, 0.05)),
                width: mediaWidth(context, 0.9),
                child: ElevatedButton(
                  onPressed: () {}, 
                  child: const Text("Agregar al carrito")
                ),
              )
            ],
          ),
        )
  
    );
  }
}