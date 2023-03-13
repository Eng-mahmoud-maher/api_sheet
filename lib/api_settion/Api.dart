import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: MyApi(),
    debugShowCheckedModeBanner: false,
  ));
}


class MyApi extends StatefulWidget {
  const MyApi({Key? key}) : super(key: key);

  @override
  State<MyApi> createState() => _MyApiState();
}

List<Photos> photo = [];
var len=0;

class _MyApiState extends State<MyApi> {
  List data = [];
  List<String> data1 = [];
  int index =1;

  void getdata() async {
    await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'))
        .then((value) {
      data = jsonDecode(value.body);

      List<Photos> photo = [];
      for (int i = 0; i < data.length; i++) {
        photo.add(Photos.fromjson(data[i]));
data1.add(photo[i].url);
        len=photo.length;

      }
      setState(() {});
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
              itemCount: len,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 30,
                  mainAxisSpacing: 80,
                  maxCrossAxisExtent: 100),
              itemBuilder: (BuildContext context,int  index) {
                return
                        Image.network(data1[index] );




              }),
    );
  }
}

class Photos {
  Photos(
      {required this.id,
      required this.albumId,
      required this.title,
      required this.thumbnailUrl,
      required this.url});
  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;
  factory Photos.fromjson(Map jsondata) {
    return Photos(
        id: jsondata['id'],
        albumId: jsondata['albumId'],
        title: jsondata['title'],
        thumbnailUrl: jsondata['thumbnailUrl'],
        url: jsondata['url']);
  }
}
