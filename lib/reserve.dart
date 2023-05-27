import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List> getData() async{
    String url = "http://192.168.56.1/bikes/rents.php";
    final http.Response response= await http.get(Uri.parse(url),
        headers: {
          'Accept':'application/json',
          // 'Access-Control-Allow-Origin': '*',
          // 'Access-Control-Allow-Headers': 'Origin, X-Auth-Token, X-Requested-With, Content-Type, Accept, Authorization,Accept-Language,Content-Language',
          // 'Content-type':'application/json',
          // 'Access-Control-Allow-Methods': 'GET,PUT,PATCH,POST,DELETE',
        });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bike rental system"),
        centerTitle: true,
      ),
      body: FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot){
          if(snapshot.hasError) print (snapshot.error);
          return snapshot.hasData? ItemList(list: snapshot.data as List,): Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  const ItemList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Text("Status: ${list[i]['status']}"),
    return ListView.builder(
        itemCount: list == null? 0: list.length,
        itemBuilder:(context,i){
          return DataTable(
              columns: [
                DataColumn(label: Text('time')),
                DataColumn(label: Text('price')),
                DataColumn(label: Text('time_out')),
                DataColumn(label: Text('time_in')),
                DataColumn(label: Text('status')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text(list[i]['time']),),
                  DataCell(Text(list[i]['price']),),
                  DataCell(Text(list[i]['time_out']),),
                  DataCell(Text(list[i]['time_in']),),
                  DataCell(Text(list[i]['status']),),
                ]),
              ]);
        }
    );
  }
}


