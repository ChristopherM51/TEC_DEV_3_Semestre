import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView com Card',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView com Card'),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300, // largura do card
              child: Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Título do Card'),
                  subtitle: Text('Informações fictícias'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    // Ação ao clicar no card
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
