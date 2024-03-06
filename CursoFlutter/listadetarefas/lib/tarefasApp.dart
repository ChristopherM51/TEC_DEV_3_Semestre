import 'package:flutter/material.dart';
import 'package:listadetarefas/tarefasScreen.dart';
import 'tarefasController.dart';
import 'package:provider/provider.dart';

class TarefasApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Definindo a tela inicial como a TarefasScreen
      home: ChangeNotifierProvider(
        create: (context) => TarefasController(),
        child: ListaTarefasScreen(),
      ), // ChangeNotifierProvider
    ); // MaterialApp
  }
}