import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Row and Column Layout',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Layout de Linhas e Colunas'),
          ),
          body: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Elementos organizados horizontalmente:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[Icon(Icons.home), Text('Home')],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.favorite),
                            Text('Favorite')
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Icon(Icons.settings),
                            Text('Settings')
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Row(
                        children: ([
                      Text(
                        'Elementos organizados verticalmente:',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                    SizedBox(height: 10.0),
                    Row(children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image.network(
                            'https://via.placeholder.com/150',
                            width: 150.0,
                            height: 150.0,
                          ),
                          SizedBox(height: 10.0),
                          Text('Flutter Logo'),
                          SizedBox(height: 20.0),
                          Icon(Icons.star),
                          SizedBox(height: 10.0),
                          Text('Rating'),
                        ],
                      )
                    ])
                  ])),
        ));
  }
}
