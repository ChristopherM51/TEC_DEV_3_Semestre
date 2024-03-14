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
        body: ListView(
          children: [
            Card(
              child: ListTile(
                title: Text('Item 1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 2'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 3'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 2'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 3'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 2'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 3'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 2'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 3'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 2'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 3'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 1'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 2'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Item 3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
