import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/items.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Todo List",
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
    /*
    items.add(
      Item(title: "Item 1", done: false),
    );
    items.add(
      Item(title: "Item 2", done: true),
    );
    items.add(
      Item(title: "Item 3", done: false),
    );
    */
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCrl = TextEditingController(); // Vai fazer o controle do texto

  void add() {
    // Adicionar um item ao checkbox
    if (newTaskCrl.text.isEmpty) return;
    setState(() {
      widget.items.add(
        Item(title: newTaskCrl.text, done: false),
      );
      newTaskCrl.text = ""; //newTaskCrl.clear();
      save();
    });
  }

  void remove(int index) {
    // Remover um items
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  Future load() async {
    // Carregar os dados de forma assincrona(Nunca é em tempo real)
    // Future: é como uma promessa
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();
      setState(() {
        widget.items = result;
      });
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  } // Salvando dados

  _HomePageState() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // o esqueleto da página
      appBar: AppBar(
        //leading: Text("Oi"), // Menu hamburguer
        title: TextFormField(
          controller: newTaskCrl,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
          decoration: InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ), // Cria uma caixa de texto no lugar
        /*
        actions: <Widget>[
          Icon(Icons.plus_one), // Icones canto direito
        ],
        */
      ),
      body: ListView.builder(
        // body para utilizar com listas
        itemCount: widget.items
            .length, // Diz qual o tamanho do list view, no caso sempre o tamanho da lista 'items'
        itemBuilder: (BuildContext ctxt, int index) {
          // Como serão construidos os items na tela?
          final item =
              widget.items[index]; // Código repetivel salvo em uma variavel

          return Dismissible(
            // Widget que permite arrastar os items para os lados
            child: CheckboxListTile(
              // Lista de checkbox
              title: Text(item.title), // O que serão as escritas, titulos
              value: item.done, // Valor True/False, Selecionado/NãoSelecionado
              onChanged: (value) {
                // Na mudança faça..
                setState(() {
                  // Salve o estado..
                  item.done =
                      value; // Novo estado de algo, no caso o 'done' do 'item' recebe o valor que a pessoa esta selecionando ou tirando a seleção
                  save();
                });
              },
            ),
            key: Key(item.title), // Identificador das chaves
            background: Container(
              color: Colors.red.withOpacity(0.5),
              child: Icon(Icons.close),
              alignment: AlignmentDirectional.centerEnd,
            ), // Background do Dismissible
            onDismissed: (direction) {
              remove(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // Botão de '+' para salvar tarefas
        onPressed: () {
          add();
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
