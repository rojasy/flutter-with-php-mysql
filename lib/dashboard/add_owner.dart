import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddOwner extends StatefulWidget {
  const AddOwner({Key? key}) : super(key: key);

  @override
  State<AddOwner> createState() => _AddOwnerState();
}

class _AddOwnerState extends State<AddOwner> {

  TextEditingController ownerID=TextEditingController();
  TextEditingController firstname= TextEditingController();
  TextEditingController lastname=TextEditingController();
  TextEditingController gender= TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController address= TextEditingController();
  TextEditingController nationality=TextEditingController();
  TextEditingController password= TextEditingController();

  void addOwner(){
    var url="http://192.168.56.1/bikes/addowner.php";
    http.post(Uri.parse(url),headers: {
      'Accept':'application/json',
    },body: {
      "ownerID": ownerID.text,
      "firstname":firstname.text,
      "lastname": lastname.text,
      "gender": gender.text,
      "phone": phone.text,
      "address": address.text,
      "nationality": nationality.text,
      "password":password.text,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Owner"),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: ownerID,
                  decoration: InputDecoration(
                    hintText: "ownerID",
                    labelText: "ownerID",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: firstname,
                  decoration: InputDecoration(
                    hintText: "Firstname",
                    labelText: "Firstname",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: lastname,
                  decoration: InputDecoration(
                    hintText: "lastname",
                    labelText: "lastname",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: gender,
                  decoration: InputDecoration(
                    hintText: "gender",
                    labelText: "gender",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: phone,
                  decoration: InputDecoration(
                    hintText: "phone",
                    labelText: "phone",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: address,
                  decoration: InputDecoration(
                    hintText: "address",
                    labelText: "address",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: nationality,
                  decoration: InputDecoration(
                    hintText: "nationality",
                    labelText: "nationality",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "password",
                    labelText: "password",
                  ),
                ),
                SizedBox(height: 10,),
                RaisedButton(
                  onPressed: (){
                    addOwner();
                    Navigator.of(context).pop();
                  },
                  child: Text("Add owner"),
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
