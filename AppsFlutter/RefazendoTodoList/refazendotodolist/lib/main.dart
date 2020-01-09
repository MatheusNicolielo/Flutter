import 'package:flutter/material.dart';
import 'models/items.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      debugShowCheckedModeBanner: false, // Tirar a img/logozinha de debug
      theme: ThemeData(
        primarySwatch: Colors.blue, // Paleta de Cores
      ),
      home: HomePage(), // Leva a tal home, tal build
    );
  }
}

class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];

    // Itens para teste
    items.add(
      Item(title: "Item 1", done: false),
    );
    items.add(
      Item(title: "Item 2", done: true),
    );
    items.add(
      Item(title: "Item 3", done: false),
    );
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // o esqueleto da página
      appBar: AppBar(
        //leading: Text("Menu Hamburquer"),
        title: Text("Todo List"),
        /*
        actions: <Widget>[
          Icon(Icons.plus_one), // Icones canto direito
        ],
        */
      ),
      body: ListView.builder(
        // Recomendado para utilizar com listas
        itemCount: widget.items
            .length, // Diz qual o tamanho do list view, no caso sempre o tamanho da lista 'items'
        itemBuilder: (BuildContext ctxt, int index) {
          // Como serão construidos os items na tela?
          final item =
              widget.items[index]; // Código repetivel salvo em uma variavel

          return CheckboxListTile(
            // Lista de checkbox
            title: Text(item.title), // O que serão as escritas, titulos
            key: Key(item.title), // Identificador das chaves
            value: item.done, // Valor True/False, Selecionado/NãoSelecionado
            onChanged: (value) {
              // Na mudança faça..
              setState(() {
                // Salve o estado..
                item.done =
                    value; // Novo estado de algo, no caso o 'done' do 'item' recebe o valor que a pessoa esta selecionando ou tirando a seleção
              });
            },
          );
        },
      ),
    );
  }
}
