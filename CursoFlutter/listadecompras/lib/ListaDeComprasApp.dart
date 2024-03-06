import 'package:flutter/material.dart';
import 'package:listadecompra/ListaDeComprasScreen.dart';
import 'ListaDeComprasController.dart';
import 'package:provider/provider.dart';

class ListaDeComprasApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a tela inicial como a ListaDeComprasScreen
      home: ChangeNotifierProvider(
        create: (context) => ListaDeComprasController(),
        child: ListaDeComprasScreen(),
      ), // ChangeNotifierProvider
    ); // MaterialApp
  }
}