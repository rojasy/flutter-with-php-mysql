import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_php/dashboard/rent_details.dart';
import 'package:http/http.dart' as http;

class ManageRent extends StatefulWidget {
  const ManageRent({Key? key}) : super(key: key);

  @override
  State<ManageRent> createState() => _ManageRentState();
}

class _ManageRentState extends State<ManageRent> {

  Future<List> getRentData() async{
    String url = "http://192.168.56.1/bikes/rents.php";
    final http.Response response= await http.get(Uri.parse(url),
        headers: {
          'Accept':'application/json',
        });
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manage Rent"),),
      body: FutureBuilder<List>(
        future: getRentData(),
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
                    MaterialPageRoute(builder: (context)=>RentDetails(list: list, index: i,)));
              },
              child: Card(
                child: ListTile(
                  title: Text("Customer: ${list[i]['firstname']} ${list[i]['lastname']}"),
                  leading: Icon(Icons.bike_scooter_sharp),
                  subtitle: Text("Bike: ${list[i]['name']}"),
                ),
              ),
            ),
          );
        }
    );
  }
}
