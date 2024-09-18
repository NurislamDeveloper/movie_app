import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _items = [];

  //fetch content from the json file

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
      print("...number of items${_items.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Json",
        ),
      ),
      body: _items.isNotEmpty
          ? Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(_items[index]["id"]),
                    margin: const EdgeInsets.all(10),
                    color: Colors.amber.shade900,
                    child: ListTile(
                      leading: Text(_items[index]["id"]),
                      title: Text(_items[index]['name']),
                      subtitle: Text(_items[index]["description"]),
                    ),
                  );
                },
              ),
            )
          : ElevatedButton(
              onPressed: () {
                // showAboutDialog(context: context);
              },
              child: const Text(
                "Load Json ",
              ),
            ),
    );
  }
}
