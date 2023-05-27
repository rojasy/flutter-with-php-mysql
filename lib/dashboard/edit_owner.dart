import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'manage_owner.dart';

class EditOwner extends StatefulWidget {
  List list;
  int index;
  EditOwner({required this.list,required this.index,Key? key}) : super(key: key);

  @override
  State<EditOwner> createState() => _EditOwnerState();
}

class _EditOwnerState extends State<EditOwner> {

  late TextEditingController ownerID;
  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController gender;
  late TextEditingController phone;
  late TextEditingController address;
  late TextEditingController nationality;
  late TextEditingController password;

  void editOwner(){
    var url="http://192.168.56.1/bikes/editowner.php";
    http.post(Uri.parse(url),headers: {'Accept':'application/json',},body: {
      "ownerID": widget.list[widget.index]["ownerID"],
      "firstname":firstname.text,
      "lastname": lastname.text,
      "gender": gender.text,
      "phone": phone.text,
      "address": address.text,
      "nationality": nationality.text,
      "password": password.text,
      // "status": status.text,
    });
  }

  @override
  void initState() {
    ownerID = TextEditingController(text: widget.list[widget.index]["ownerID"]);
    firstname = TextEditingController(text: widget.list[widget.index]["firstname"]);
    lastname = TextEditingController(text: widget.list[widget.index]["lastname"]);
    gender = TextEditingController(text: widget.list[widget.index]["gender"]);
    phone = TextEditingController(text: widget.list[widget.index]["phone"]);
    address = TextEditingController(text: widget.list[widget.index]["address"]);
    nationality = TextEditingController(text: widget.list[widget.index]["nationality"]);
    password = TextEditingController(text: widget.list[widget.index]["password"]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Owner"),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: ownerID,
                  decoration: InputDecoration(
                      hintText: "Owner ID",
                      labelText: "ownerID"
                  ),
                ),
                TextField(
                  controller: firstname,
                  decoration: InputDecoration(
                      hintText: "firstname",
                      labelText: "firstname"
                  ),
                ),
                TextField(
                  controller: lastname,
                  decoration: InputDecoration(
                      hintText: "lastname",
                      labelText: "lastname"
                  ),
                ),
                TextField(
                  controller: gender,
                  decoration: InputDecoration(
                      hintText: "gender",
                      labelText: "gender"
                  ),
                ),
                TextField(
                  controller: phone,
                  decoration: InputDecoration(
                      hintText: "phone",
                      labelText: "phone"
                  ),
                ),
                TextField(
                  controller: address,
                  decoration: InputDecoration(
                      hintText: "address",
                      labelText: "address"
                  ),
                ),
                TextField(
                  controller: nationality,
                  decoration: InputDecoration(
                      hintText: "nationality",
                      labelText: "nationality"
                  ),
                ),
                TextField(
                  controller: password,
                  decoration: InputDecoration(
                      hintText: "password",
                      labelText: "password"
                  ),
                ),
                SizedBox(height: 10,),
                RaisedButton(
                  onPressed: (){
                    editOwner();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ManageOwner()));
                  },
                  child: Text("Edit Owner"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
