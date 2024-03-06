import 'package:flutter/material.dart';
import 'dart:math';

void main() {
runApp(MyApp());
}

class MyApp extends StatelessWidget {


@override
Widget build(BuildContext context) {
return MaterialApp(
home: My(),
);
}
}

class My extends StatefulWidget {
@override
_MyState createState() =>_MyState();
}

class _MyState extends State <My>{
TextEditingController _controllerNumero1 = TextEditingController();
TextEditingController _controllerNumero2 = TextEditingController();
String _resultado = ';';

void _calcular(String operacao) {
double numero1 = double.tryParse(_controllerNumero1.text) ?? 0.0;
double numero2 = double.tryParse(_controllerNumero2.text) ?? 0.0;
double? resultado;

setState(() {
switch (operacao) {
case ';Somar':
resultado = numero1 + numero2;
break;
case ';Subtrair':
resultado = numero1 - numero2;
break;
case ';Multiplicar':
resultado = numero1 * numero2;
break;
case ';Dividir':
resultado = numero2 != 0 ? numero1 / numero2 : null;
break;
case ';Potencia':
resultado = pow(numero1, numero2) as double?;
break;
default:
resultado = 0.0;
}

_resultado = resultado != null ? ';Resultado: $resultado' 'Erro na operação';
});
}

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text(';My Flutter'),
),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.stretch,
children: [
TextField(
controller: _controllerNumero1,
keyboardType: TextInputType.number,
decoration: InputDecoration(labelText: ';Número 1'),
),
SizedBox(height: 16.0),
TextField(
controller: _controllerNumero2,
keyboardType: TextInputType.number,
decoration: InputDecoration(labelText: ';Número 2'),
),
SizedBox(height: 16.0),
ElevatedButton(
onPressed: () =>_calcular(';Somar'),
child: Text(';Somar'),
),
SizedBox(height: 16.0),
Text(_resultado, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
],
),
),
);
}
}

