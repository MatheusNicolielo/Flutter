import 'dart:io';

int opcao;


main(){
  bool condicao = true;
  List<String> produtos = [];

  while(condicao){
    menu();

    switch (opcao) {
      case 1:
        print("\x1B[2J\x1B[0;0H");
        adicionarProduto(produtos);
        break;
      case 2:
        print("\x1B[2J\x1B[0;0H");
        listarProdutos(produtos);
        print("enter....");
        String aux = stdin.readLineSync();
        break;
      case 3:
        print("\x1B[2J\x1B[0;0H");
        removerProdutos(produtos);
        print("enter....");
        String aux = stdin.readLineSync();
        break;
      case 0:
        condicao = false;
        print("\x1B[2J\x1B[0;0H");
        break;
      default:
    }

  }
}


menu(){
  print("\x1B[2J\x1B[0;0H");

  print("1 - ADICIONAR PRODUTO");
  print("2 - LISTAR PRODUTOS");
  print("3 - REMOVER PRODUTOS");
  print("0 - SAIR");
  print("Informe a opção desejada: ");
  opcao = int.parse(stdin.readLineSync());
}

adicionarProduto(produtos){
  print("\x1B[2J\x1B[0;0H");
  print("Informe o nome do produto:");
  String text = stdin.readLineSync();
  produtos.add(text);
}

listarProdutos(produtos){  
  print("--- PRODUTOS NO CARRINHO DE COMPRAS ---");
  for (var i = 0; i < produtos.length; i++) {
    print("${i+1} : ${produtos[i]}");
  }
}

removerProdutos(produtos){
  listarProdutos(produtos);
  print("Qual produto deseja remover: ");
  int opcao_remover = int.parse(stdin.readLineSync());
  produtos.removeAt(opcao_remover-1);
  print("Produto Removido");
}

