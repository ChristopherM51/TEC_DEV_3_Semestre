import 'package:app_carros/model.dart';

class CarroController {
  //
  // Atributos
  List<Carro> _listaDeCarros = [
    Carro("Fiat Uno", 1992,"caminho da imagem"),
    Carro("GOL", 1996, "caminho da imagem2")];
  //
  // Métodos
  List<Carro> get listarCarros => _listaDeCarros;
  //
  // Outros Métodos
  void adicionarCarro(String modelo, int ano, String imagemUrl) {
    //add obj "carro" da classe "Carro" com seus paramentros
    Carro carro = Carro(modelo, ano, imagemUrl);
    _listaDeCarros.add(carro);
  }
}
