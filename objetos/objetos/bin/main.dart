import 'package:objetos/src/pessoas.dart';

void main(List<String> arguments) {
  Pessoa matheus = Pessoa(nome: "Matheus", idade: 20, sexo: "Masculino");

  print(matheus.nome);
  print(matheus.idade);
  print(matheus.sexo);
}

