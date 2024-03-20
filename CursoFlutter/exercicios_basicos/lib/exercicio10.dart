import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimationDemo(),
    );
  }
}

class AnimationDemo extends StatefulWidget {
  @override
  _AnimationDemoState createState() => _AnimationDemoState();
}

class _AnimationDemoState extends State<AnimationDemo> {
  Color _containerColor = Colors.blue;

  void _changeColor() {
    setState(() {
      _containerColor = _containerColor == Colors.blue ? Colors.green : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animação Simples'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _changeColor();
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 200.0,
            height: 200.0,
            color: _containerColor,
            child: Center(
              child: Text(
                'Clique para mudar de cor',
                style: TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
