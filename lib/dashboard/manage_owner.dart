import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'owner_details.dart';

class ManageOwner extends StatefulWidget {
  const ManageOwner({Key? key}) : super(key: key);

  @override
  State<ManageOwner> createState() => _ManageOwnerState();
}

class _ManageOwnerState extends State<ManageOwner> {

  Future<List> getOwnerData() async{
    String url = "http://192.168.56.1/bikes/ownerdetails.php";
    final http.Response response= await http.get(Uri.parse(url),
        headers: {
          'Accept':'application/json',
        });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List of owners"),),
      body: FutureBuilder<List>(
        future: getOwnerData(),
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
                    MaterialPageRoute(builder: (context)=>OwnerDetails(list: list, index: i,)));
              },
              child: Card(
                child: ListTile(
                  title: Text("Owner Name: ${list[i]["firstname"]} ${list[i]["lastname"]}"),
                  leading: Icon(Icons.bike_scooter_sharp),
                  subtitle: Text("ID: ${list[i]['ownerID']}"),
                ),
              ),
            ),
          );
        }
    );
  }
}

