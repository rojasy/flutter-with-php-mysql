import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'bike_details.dart';

class ManageBike extends StatefulWidget {
  const ManageBike({Key? key}) : super(key: key);

  @override
  State<ManageBike> createState() => _ManageBikeState();
}

class _ManageBikeState extends State<ManageBike> {

  Future<List> getBikeData() async{
    String url = "http://192.168.56.1/bikes/bikesdata.php";
    final http.Response response= await http.get(Uri.parse(url),
        headers: {
          'Accept':'application/json',
        });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List of bikes"),),
      body: FutureBuilder<List>(
        future: getBikeData(),
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
          return Container(
            padding: EdgeInsets.all(10),
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>bikeDetails(list: list, index: i,)));
              },
              child: Card(
                child: ListTile(
                  title: Text("Bike Name: ${list[i]['name']}"),
                  leading: Icon(Icons.bike_scooter_sharp),
                  subtitle: Text("ID: ${list[i]['bikeID']}"),
                ),
              ),
            ),
          );
        }
    );
  }
}
