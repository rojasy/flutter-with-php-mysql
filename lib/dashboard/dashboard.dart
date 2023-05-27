
import 'package:flutter/material.dart';
import 'package:flutter_php/side_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String username="";

  Future getUsername()async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString("username")!;
    });
  }

  Future logOut()async{
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.remove(username);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bike Rental"),
        centerTitle: true,
      ),
      drawer: SideDrawer(),
      body: Container(
        child: Column(
          children: [
            Center(child:
              username == "" ? Text("no data username"): Text(username),
            ),
            RaisedButton(
              onPressed: (){
                logOut();
              },
              child: Text("Log out"),
            ),
          ],
        ),

      ),
      // initialRoute: 'dashboard',
      // routes: {
      //   'dashboard':(context)=>Dashboard(),
      //   'profile':(context)=>Profile(),
      //   'add_owner':(context)=>AddOwner(),
      //   'add_bike':(context)=>AddBike(),
      //   'add_rent':(context)=>AddRent(),
      //   'manage_rent':(context)=>ManageRent(),
      // },

    );
  }
}
