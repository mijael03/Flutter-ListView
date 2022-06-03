import 'dart:async';
import 'dart:convert';
import 'screen/detail_screend.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List? data;
  String uri = "https://api.tableful.online/table/62705b424f5f86278d3c8a5c";

  Future<String> getData() async {
    var response = await http.get(
        Uri.parse(uri),
        headers: {"Accept": "application/json"});

    setState(() {
      data = jsonDecode(response.body);
    });

    print(data![1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          title: const Text("Listviews"), backgroundColor: Colors.blue),
      body: ListView.builder(
        itemCount: data == null ? 0 : data!.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(data![index]["title"]),
            trailing: const Icon(Icons.keyboard_arrow_right_sharp),
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: 
                (context) => DetailScreen(note: data![index]["description"])) );
            },
          );
        },
      ),
    );
  }
}
