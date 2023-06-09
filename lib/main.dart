import 'package:bananachallenge/color/index.dart';
import 'package:bananachallenge/logIn/view.dart';
import 'package:bananachallenge/provider/logIn.dart';
import 'package:bananachallenge/provider/productsProvider.dart';
import 'package:bananachallenge/routes/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
/*     ChangeNotifierProvider(
      create: (_) => MultiProvider(providers: [

      ],),
      child: const MyApp(),
    
    ) */
    

    MultiProvider(
      providers: [
        ChangeNotifierProvider (create: (_) => ProductsProvider()),
        ChangeNotifierProvider (create: (_) => LogInProvider()),
      ],
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getRoutes(context),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: buildMaterialColor(Color(0xFF9E007E)),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      body: Center(
        child: LogIn()
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
