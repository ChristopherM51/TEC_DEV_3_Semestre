import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(SorteioApp());
}

class SorteioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Sorteio(),
    );
  }
}

class Sorteio extends StatefulWidget {
  @override
  _SorteioState createState() => _SorteioState();
}

class _SorteioState extends State<Sorteio> {
  TextEditingController _palpite = TextEditingController();
  int numeroSorteado =
      Random().nextInt(1000) + 1; // Generate a random number between 1 and 1000
  String _resultado = '';
  int tentativas = 0;
  bool acertou = false;

  void _verificarPalpite() {
    int palpite = int.tryParse(_palpite.text) ?? 0;
    String novoResultado;

    if (palpite < numeroSorteado) {
      novoResultado = "Mais alto";
      tentativas++;
    } else if (palpite > numeroSorteado) {
      novoResultado = "Mais baixo";
      tentativas++;
    } else {
      novoResultado =
          "Parabens! Você acertou! O número era $numeroSorteado. Você so precisou de $tentativas tentativas!";
      acertou = true;
    }

    setState(() {
      _resultado = novoResultado;
    });
  }

  void _reiniciar() {
    int numeroSorteado = Random().nextInt(1000) + 1;
    tentativas = 0;
    _resultado = "";
    acertou = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sorteio Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _palpite,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Palpite'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () => _verificarPalpite(),
              child: Text("Tentar"),
            ),
            SizedBox(height: 10.0),
            Visibility(
              visible: acertou,
              child: ElevatedButton(
                onPressed: () => _reiniciar(),
                child: Text("REINICIAR"),
              ),
            ),
            SizedBox(height: 16.0),
            Text(_resultado,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
