import 'package:app_carros/Controller.dart';
import 'package:app_carros/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaCarros extends StatelessWidget {
  final CarroController controllerCarros;
  TelaListaCarros(this.controllerCarros);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Meus Carros'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child:
                //Consumer<CarroController>(
                //builder: (context, model, child) {
                //return
                ListView.builder(
              itemCount: controllerCarros.listarCarros.length,
              itemBuilder: (context, index) {
                return ListTile(
                  // Exibe os carros listados no Controller
                  title: Text(controllerCarros.listarCarros[index].modelo),
                  // Quando clicado o carro vai abrir a telaDescricaoCarro
                  onTap: () {
                    // Criar método para trocar a tela
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TelaDetalheCarro(
                            controllerCarros.listarCarros[index]),
                      ),
                    );
                  },
                );
              },
            ),
            //},
            //),
          ),
        ],
      ),
      // Adicionar FloatButton
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _adicionarCarro(context);
          },
          child: Icon(Icons.add),
      ),
    );
    // TUDO: implement build
    UnimplementedError();
  }
  
  void _adicionarCarro(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Adicionar Carro'),
        // Add your form or input fields here
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // Add logic to save the new car
              Navigator.pop(context);
            },
            child: Text('Salvar'),
          ),
        ],
      ),
    );
  }
}

class TelaDetalheCarro extends StatelessWidget {
  final Carro carro;
  TelaDetalheCarro(this.carro);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Carro"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(carro.imagemUrl),
            SizedBox(height: 20),
            Text("Modelo: ${carro.modelo}"),
            Text("Ano: ${carro.ano}"),
          ],
        ),
      ),
    );
  }
}
