import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class post1 extends StatefulWidget {
  const post1({super.key});

  @override
  State<post1> createState() => _post1State();
}

class _post1State extends State<post1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email,String pass) async{
    try{
      Response response1 = await post(Uri.parse("https://reqres.in/api/register"),
      body: {
        'email':email,
        'password':pass
      });
      if(response1.statusCode == 200){
        var datas =jsonDecode(response1.body.toString());
        print(datas);
        print("Succsfully!!!!!!!!!!  --> "+email.toString());
      }else{
        print("errorrrrrrr");

      }
    }catch(ex){
      print(ex.toString());
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              login(emailController.text.toString(), passwordController.text.toString());
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
