import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Container Layout',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Basic Container Layout'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          color: Colors.grey[200],
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.only(bottom: 10.0),
                color: Colors.blue,
                child: Text(
                  'Widget 1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.only(bottom: 10.0),
                color: Colors.green,
                child: Center(
                  child: Text(
                    'Widget 2',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.orange,
                width: MediaQuery.of(context).size.width*0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      'Widget 3',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
