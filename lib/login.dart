import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard/dashboard.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async{
    if(username.text == "" || password.text == ""){
      Fluttertoast.showToast(
        msg: "Both field cannot be empty",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        fontSize: 16,
      );
    }
    else{
      var url="http://192.168.56.1/bikes/login.php";
      final response = await http.post(Uri.parse(url),headers: {'Accept':'application/json',},body: {
        "username": username.text,
        "password": password.text,
      });
      var data=json.decode(response.body);
      if(data == "success"){
        SharedPreferences preferences= await SharedPreferences.getInstance();
        preferences.setString('username',username.text);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
      }
      else{
        Fluttertoast.showToast(
          msg: "Username and password does not match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          fontSize: 16,
        );
      }
    }

  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Welcome to Bike Rental",style: TextStyle(color: Colors.deepPurple,fontSize: 24),),
            SizedBox(height: 20,),
            TextField(
              controller: username,
              decoration: InputDecoration(
                hintText: "username",
                hintStyle: TextStyle(color: Colors.deepPurple),
                focusColor: Colors.deepPurple,
                fillColor: Colors.deepPurple,
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "password",
                hintStyle: TextStyle(color: Colors.deepPurple),
                focusColor: Colors.deepPurple,
                fillColor: Colors.deepPurple,
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20,),
            ButtonTheme(
              minWidth: 200.0,
                height: 50,
                child: RaisedButton(
                  onPressed: (){
                    login();
                  },
                  child: Text("Login",style: TextStyle(color: Colors.white),),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
