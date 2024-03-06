import 'package:listadetarefas/tarefasModel.dart';
import 'package:flutter/material.dart';


class TarefasController extends ChangeNotifier {
  List<Tarefas> _tarefas = [];
  List<Tarefas> get tarefas => _tarefas;

  //metodo para adiconar  uma nova tarefa
  void adicionarTarefa(String descricao) {
    if (descricao.trim().isNotEmpty){
    _tarefas.add(Tarefas(descricao, false));
    notifyListeners();
  }
  }

  void marcarComoConcluida(int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas[indice].concluida = true;
      notifyListeners();
    }
  }
  void excluirTarefa (int indice) {
    if (indice >= 0 && indice < _tarefas.length) {
      _tarefas.remove(indice);
      // Notifica os ouvintes sobre a mudança no estado
      notifyListeners();
    }
  }
}