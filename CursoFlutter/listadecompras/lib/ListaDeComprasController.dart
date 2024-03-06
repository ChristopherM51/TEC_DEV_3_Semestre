import 'package:flutter/material.dart';
import 'package:listadecompra/ListaDeComprasModel.dart';

class ListaDeComprasController extends ChangeNotifier {
  List<Compras> _itens = [];
  List<Compras> get compras => _itens;

  // Método para adicionar uma nova compra
  void adicionarCompra(BuildContext context, String descricao) {
    // Verifica se a descrição não está vazia
    if (descricao.trim().isNotEmpty) {
      // Verifica se o item já está na lista de compras
      if (!_itens.any((compra) => compra.descricao == descricao)) {
        // Adiciona o item apenas se não estiver na lista
        _itens.add(Compras(descricao, false));
        notifyListeners();
      } else {
        // Item já existe na lista, exibe um pop-up de erro
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro'),
              content: Text('Item já adicionado à lista de compras.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void editarItem(int indice, String novaDescricao) {
    if (indice >= 0 && indice < _itens.length) {
      _itens[indice].descricao = novaDescricao;
      notifyListeners();
    }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens[indice].concluida = true;
      notifyListeners();
    }
  }
  
  void apagarItensMarcados() {
  _itens.removeWhere((compra) => compra.concluida);
  notifyListeners();
}

  void excluirItem(int indice) {
    if (indice >= 0 && indice < _itens.length) {
      _itens.removeAt(indice);
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }

  void excluirTarefasSelecionadas() {
  _itens.removeWhere((compra) => compra.concluida);
  notifyListeners();
}
}
