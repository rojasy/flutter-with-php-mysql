
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username="";

  Future<List> getOwnerData() async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    String url = "http://192.168.56.1/bikes/ownerdata.php";
    final http.Response response= await http.post(Uri.parse(url),
        headers: {
          'Accept':'application/json',
        },body:{
      "username":preferences.getString("username")
    });
    return json.decode(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),
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
        // Text("Firstname: ${list[i]['firstname']}"),
        itemBuilder:(context,i){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Firstname: ${list[i]['firstname']}"),
              SizedBox(height: 10,),
              Text("Lastname: ${list[i]['lastname']}"),
              SizedBox(height: 10,),
              Text("Gender: ${list[i]['gender']}"),
              SizedBox(height: 10,),
              Text("Phone: ${list[i]['phone']}"),
              SizedBox(height: 10,),
              Text("Address: ${list[i]['address']}"),
              SizedBox(height: 10,),
              Text("nationality: ${list[i]['nationality']}"),
              SizedBox(height: 15,),
              RaisedButton(
                onPressed: (){},
                child: Text("EDIT"),
                color: Colors.green,
              ),
            ],
          );
        }
    );
  }
}
