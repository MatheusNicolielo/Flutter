import 'dart:io';

Map<String, dynamic> cadastro;

main(){
  print("--- Digite o seu Nome: ");
  String nome = stdin.readLineSync();
  cadastro["nome"] = nome;

  print("--- Digite sua idade: ");
  int idade = int.parse(stdin.readLineSync());
  cadastro["idade"] = idade;

}