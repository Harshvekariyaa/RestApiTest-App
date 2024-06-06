import 'dart:convert';

import 'package:api1/newapiSeries/n1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class test1 extends StatefulWidget {

  const test1({super.key});

  @override
  State<test1> createState() => _test1State();
}

class _test1State extends State<test1> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemCount: users.length, itemBuilder: (context, index) {
        final user = users[index];

        return ListTile(
          leading: Text("${index+1}"),
          tileColor: user.gender == 'male' ? Colors.lightBlueAccent : Colors.lightGreenAccent,
          title: Text(user.name.first,style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
          subtitle: Text(user.gender.toString(),style: TextStyle(fontSize: 15),),
          trailing: Text(user.nat,style: TextStyle(fontSize: 15),),
        );
      },),

      floatingActionButton: FloatingActionButton(
        child: Center(child: Text("Show"),),
        onPressed: (){
          fetchuser();
        },
      ),
    );
  }
  void fetchuser() async{
    final url = "https://randomuser.me/api/?results=20";
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final transport = results.map((e) {
      final name = n1name(title: e['name']['title'], first: e['name']['first'], last: e['name']['last']);
      return n1(cell: e['cell'],email: e['email'],gender: e['gender'],nat: e['nat'],phone: e['phone'],name: name);
    }).toList();
    setState(() {
      users = transport;
    });

  }
}


