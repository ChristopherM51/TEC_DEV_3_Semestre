import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabLayout(),
    );
  }
}

class TabLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Número de abas
      child: Scaffold(
        appBar: AppBar(
          title: Text('Layout com Abas'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Aba 1'),
              Tab(text: 'Aba 2'),
              Tab(text: 'Aba 3'),
            ],
          ),
        ),
        body: TabBarView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProductCard(
                imageUrl: '../lib/img/got.png',
                title: 'Produto 1',
                description: 'Descrição do Produto 1',
              ),
            ],
          ),
          // Conteúdo da Aba 1
          Center(
            child: Text('Conteúdo da Aba 1'),
          ),
          // Conteúdo da Aba 2
          Center(
            child: Text('Conteúdo da Aba 2'),
          ),
          // Conteúdo da Aba 3
          Center(
            child: Text('Conteúdo da Aba 3'),
          ),
        ]),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text(
                  'Opções do Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                title: Text('Opção 1'),
                onTap: () {
                  // Adicione a lógica para ação quando a opção 1 for selecionada
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Opção 2'),
                onTap: () {
                  // Adicione a lógica para ação quando a opção 2 for selecionada
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Opção 3'),
                onTap: () {
                  // Adicione a lógica para ação quando a opção 3 for selecionada
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const ProductCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Defina a altura desejada do card
      child: Card(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: 200,
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
