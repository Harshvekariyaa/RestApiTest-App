import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class uploadImage extends StatefulWidget {
  const uploadImage({super.key});

  @override
  State<uploadImage> createState() => _uploadImageState();
}

class _uploadImageState extends State<uploadImage> {
  File? image1;
  final _picker = ImagePicker();


  Future getimg() async{
    final pickimg = await _picker.pickImage(source: ImageSource.gallery);
    if(pickimg!=null){
      image1 = File(pickimg.path);
      setState(() {

      });
    }else{
      print("not selected...");
    }
  }

  Future uploadImg() async{
    setState(() {
    });
    var stream = http.ByteStream(image1!.openRead());
    stream.cast();

    int len = image1!.length() as int;

    var uri = Uri.parse("https://fakestoreapi.com/products");

    var reqest = new http.MultipartRequest("POST", uri);

    reqest.fields['title'] = "static title";

    var multiport = new http.MultipartFile("image1", stream, len);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: image1 == null
                ? Center(
                    child: Text("Pick Image."),
                  )
                : Container(
                    child: Center(
                      child: Image.file(
                        File(image1!.path).absolute,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
