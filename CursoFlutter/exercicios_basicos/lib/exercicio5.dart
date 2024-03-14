import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ContactForm(),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, digite seu nome';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, digite seu e-mail';
                  }
                  // Adicione validação de e-mail se necessário
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _messageController,
                decoration: InputDecoration(labelText: 'Mensagem'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, digite sua mensagem';
                  }
                  return null;
                },
                maxLines: 4,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Implemente a lógica para enviar o formulário
                    String name = _nameController.text;
                    String email = _emailController.text;
                    String message = _messageController.text;

                    // Exemplo: Envio de dados para uma função ou API
                    print('Nome: $name');
                    print('E-mail: $email');
                    print('Mensagem: $message');

                    // Limpar os campos após o envio do formulário
                    _nameController.clear();
                    _emailController.clear();
                    _messageController.clear();
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
