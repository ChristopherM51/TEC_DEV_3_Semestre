import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Minha Aplicação'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Ação ao pressionar o ícone de pesquisa
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Ação ao pressionar o ícone de configurações
              },
            ),
          ],
        ),
        body: Center(
          child: Image.asset(
            '../lib/img/got.png', // Substitua com o caminho da sua imagem local
            width: 200, // Ajuste o tamanho conforme necessário
            height: 200,
            fit: BoxFit.contain, // Ajuste o modo de ajuste conforme necessário
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Navegar para a aba "Início"
                },
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  // Navegar para a aba "Favoritos"
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Navegar para a aba "Perfil"
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
