import 'dart:convert';
import 'package:api1/Modules/postman2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class model2 extends StatefulWidget {
  const model2({super.key});

  @override
  State<model2> createState() => _model2State();
}

class _model2State extends State<model2> {

  List<Photos> postman_2 = [];

  Future<List<Photos>> getPostApi2() async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    var datas = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(Map i in datas){
        Photos photos = Photos(id: i['id'], title: i['title'], url: i['url']);
        postman_2.add(photos);
      }
      return postman_2;
    }else{
      return postman_2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photos fetch...")),

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi2(),
              builder: (context,AsyncSnapshot<List<Photos>> snapshot) {
                if(!snapshot.hasData){
                  return Text("No data found!!!");
                }else{
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(snapshot.data![index].id.toString()),
                          leading: CircleAvatar(backgroundImage: NetworkImage(snapshot.data![index].url.toString()),),
                          subtitle: Text(snapshot.data![index].title.toString()),

                        );
                      },
                      itemCount: postman_2.length);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
class Photos{
  String title,url;
  int id;
  Photos({required this.id,required this.title,required this.url});
}
