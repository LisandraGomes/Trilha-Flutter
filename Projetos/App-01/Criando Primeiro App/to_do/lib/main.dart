import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'models/item.dart';

import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo Futter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  var items = [];

  HomePage() {
    items = [];
    // items.add(Item(title: "1 - Frist Task of DAY", done: false));
  }
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl = TextEditingController();

  void add() {
    if (newTaskCtrl.text.isEmpty) return;
    setState(() {
      widget.items.add(Item(
        title: newTaskCtrl.text,
        done: false,
      ));
      newTaskCtrl.text = "";
      save();
    });
  }

  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Item> result = decoded.map((e) => Item.fromJson(e)).toList();
      setState(() {
        widget.items = result;
      });
    }
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  }

  _HomePageState() {
    load();
  }

  void remove(int index) {
    setState(() {
      widget.items.removeAt(index);
      save();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
            controller: newTaskCtrl,
            decoration: InputDecoration(
                labelText: "Tarefas:",
                labelStyle: TextStyle(color: Colors.white)),
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            )),
        actions: <Widget>[Icon(Icons.account_circle_sharp)],
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext ctxt, int index) {
          final Item = widget.items[index];
          return Dismissible(
            child: CheckboxListTile(
                title: Text(
                  Item.title,
                  style: TextStyle(fontSize: 18),
                ),
                value: Item.done,
                onChanged: (value) {
                  setState(() {
                    Item.done = value;
                    save();
                  });
                }),
            key: Key(Item.title),
            background: Container(
              color: Color.fromARGB(255, 255, 121, 111),
              child: Center(
                  child: Text(
                "Excluir",
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
            ),
            onDismissed: (direction) {
              //if (direction == DismissDirection.endToStart) {
              remove(index);
              //}
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
