import 'dart:convert';
import 'package:flutter/material.dart';
import 'Modules/postman.dart';
import 'package:http/http.dart' as http;

class model1 extends StatefulWidget {
  const model1({super.key});

  @override
  State<model1> createState() => _model1State();
}

class _model1State extends State<model1> {

  List<Postman> postman1 = [];

  Future<List<Postman>> getPostApi () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in data){
        postman1.add(Postman.fromJson(i));
      }
      return postman1;
    }else{
      return postman1;
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Fetch Data...",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
              builder: (context, snapshot) {
                if(!snapshot.hasData){
                  return Text("Loading.....");
                }else{
                  return ListView.builder(
                    itemCount: postman1.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: Column(
                            children: [
                              Text("TITLE...\n"+postman1[index].title.toString()),
                              Text("DESCRIPTION...\n"+postman1[index].body.toString()),
                            ],
                          ));
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
