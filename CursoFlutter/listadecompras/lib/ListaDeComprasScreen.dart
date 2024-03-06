import 'package:flutter/material.dart';
import 'package:listadecompra/ListaDeComprasController.dart';
import 'package:provider/provider.dart';

class ListaDeComprasScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras'),
        leading: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            Provider.of<ListaDeComprasController>(context, listen: false)
                .excluirTarefasSelecionadas();
          },
        ),
        actions: [
          Consumer<ListaDeComprasController>(
            builder: (context, model, child) {
              if (model.compras.any((compra) => compra.concluida)) {
                return IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Implemente a lógica para editar tarefas aqui
                  },
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Adicionar Novo Item',
                suffixIcon: IconButton(
                  onPressed: () {
                    Provider.of<ListaDeComprasController>(context,
                            listen: false)
                        .adicionarCompra(context, _controller.text);
                    _controller.clear();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          ),
          Expanded(
            child: Consumer<ListaDeComprasController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.compras.length,
                  itemBuilder: (context, indice) {
                    return ListTile(
                      title: Text(model.compras[indice].descricao),
                      trailing: Checkbox(
                        value: model.compras[indice].concluida,
                        onChanged: (value) {
                          model.marcarComoConcluida(indice);
                        },
                      ),
                      onLongPress: () {
                        model.excluirItem(indice);
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
