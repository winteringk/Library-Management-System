import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  List _data = [];

  Future<void> _getData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/data'));
    final jsonData = json.decode(response.body);

    setState(() {
      _data = jsonData;
    });
  }

  Future<void> _postData(String name, String email) async {
    final response = await http.post(
      Uri.parse('http://localhost:3000/data'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'name': name,
        'email': email,
      }),
    );

    _getData();
  }

  @override
  void initState() {
    super.initState();

    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (context, index) {
                final item = _data[index];
                return ListTile(
                  title: Text(item['name']),
                  subtitle: Text(item['email']),
                );
              },
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
            ),
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Email',
            ),
            onChanged: (value) {
              setState(() {
                _email = value;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              _postData(_name, _email);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}
