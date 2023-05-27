import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_php/dashboard/dashboard.dart';
import 'package:flutter_php/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'dashboard/add_bike.dart';
import 'dashboard/add_owner.dart';
import 'dashboard/add_rent.dart';
import 'dashboard/manage_rent.dart';
import 'dashboard/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences= await SharedPreferences.getInstance();
  var username = preferences.getString("username");
  runApp(MaterialApp(home:username == null ? Login() : Dashboard()));
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final String username=preferences.getString("username");;
//     return MaterialApp(
//       title: 'Bike Rental',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: username ==null ? Login() : Dashboard(),
//       // initialRoute: 'dashboard',
//       // routes: {
//       //   'dashboard':(context)=>Dashboard(),
//       //   'profile':(context)=>Profile(),
//       //   'add_owner':(context)=>AddOwner(),
//       //   'add_bike':(context)=>AddBike(),
//       //   'add_rent':(context)=>AddRent(),
//       //   'manage_rent':(context)=>ManageRent(),
//       // },
//     );
//   }
// }



