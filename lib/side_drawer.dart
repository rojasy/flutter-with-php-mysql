import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dashboard/add_bike.dart';
import 'dashboard/add_owner.dart';
import 'dashboard/manage_bike.dart';
import 'dashboard/manage_owner.dart';
import 'dashboard/manage_rent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_php/dashboard/dashboard.dart';

import 'dashboard/profile.dart';



class SideDrawer extends StatelessWidget {
   SideDrawer({Key? key}) : super(key: key);

  Future<List> getData() async{
    String url = "http://192.168.56.1/bikes/ownerdata.php";
    final http.Response response= await http.get(Uri.parse(url),
        headers: {
          'Accept':'application/json',
        });
    return json.decode(response.body);


  }
  String username="";

  Future getUserdata()async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
      username = preferences.getString("username")!;

  }



  @override
  Widget build(BuildContext context) {
    return Container(
      child:Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              accountName: Text("Rojasy Ngaiza"),
              accountEmail: Text("rojasyngaiza01@gmail.com"),
              currentAccountPicture: CircleAvatar(backgroundImage: AssetImage("images/roja.jpg"),),
          ),
          ListTile(
            title: Text("Dashboard"),
            leading: Icon(Icons.home),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()))
          ),
          ListTile(
            title: Text("Profile"),
            leading: Icon(Icons.person),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
            }
          ),
          ListTile(
            title: Text("Add Bike"),
            leading: Icon(Icons.bike_scooter),
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>AddBike())
              );
            },
          ),
          ListTile(
            title: Text("Manage Bike"),
            leading: Icon(Icons.bike_scooter),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>ManageBike())
              );
            },
          ),
          ListTile(
            title: Text("Add Owner"),
            leading: Icon(Icons.person),
            onTap: (){
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>AddOwner()));
            }
          ),
          ListTile(
              title: Text("Manage Owner"),
              leading: Icon(Icons.person),
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>ManageOwner()));
              }
          ),
          ListTile(
            title: Text("Add Rent"),
            leading: Icon(Icons.pedal_bike_rounded),
            onTap: ()=>Navigator.pushNamed(context, 'add_rent'),
          ),
          ListTile(
            title: Text("Manage Rent"),
            leading: Icon(Icons.bike_scooter_sharp),
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ManageRent()));

            }
          ),
          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.pedal_bike_rounded),
            onTap: (){
              // Navigator.push(context, MaterialPageRoute(builder: (context)=>logOut()));
            }
          ),
        ],
      ),),
    );
  }
}
