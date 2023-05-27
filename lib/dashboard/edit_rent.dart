import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'manage_rent.dart';

class EditRent extends StatefulWidget {
  List list;
  int index;
  EditRent({required this.list,required this.index,Key? key}) : super(key: key);

  @override
  State<EditRent> createState() => _EditRentState();
}

class _EditRentState extends State<EditRent> {

  late TextEditingController firstname;
  late TextEditingController lastname;
  late TextEditingController bike;
  late TextEditingController time;
  late TextEditingController price;
  late TextEditingController timeout;
  late TextEditingController timein;
  late TextEditingController status;

  void editRent(){
    var url="http://192.168.56.1/bikes/editrent.php";
    http.post(Uri.parse(url),headers: {'Accept':'application/json',},body: {
      "rentID": widget.list[widget.index]["rentID"],
      "firstname":firstname.text,
      "lastname": lastname.text,
      "bike": bike.text,
      "time": time.text,
      "price": price.text,
      "timeout": timeout.text,
      "timein": timein.text,
      "status": status.text,
    });
  }

  @override
  void initState() {
    firstname = TextEditingController(text: widget.list[widget.index]["firstname"]);
    lastname = TextEditingController(text: widget.list[widget.index]["lastname"]);
    bike = TextEditingController(text: widget.list[widget.index]["name"]);
    time = TextEditingController(text: widget.list[widget.index]["time"]);
    price = TextEditingController(text: widget.list[widget.index]["price"]);
    timeout = TextEditingController(text: widget.list[widget.index]["time_out"]);
    timein = TextEditingController(text: widget.list[widget.index]["time_in"]);
    status = TextEditingController(text: widget.list[widget.index]["status"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Rent"),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: firstname,
                  decoration: InputDecoration(
                    hintText: "Firstname",
                    labelText: "Firstname"
                  ),
                ),
                TextField(
                  controller: lastname,
                  decoration: InputDecoration(
                      hintText: "Lastname",
                      labelText: "Lastname"
                  ),
                ),
                TextField(
                  controller: bike,
                  decoration: InputDecoration(
                      hintText: "Bike",
                      labelText: "Bike"
                  ),
                ),
                TextField(
                  controller: time,
                  decoration: InputDecoration(
                      hintText: "Time",
                      labelText: "Time"
                  ),
                ),
                TextField(
                  controller: price,
                  decoration: InputDecoration(
                      hintText: "Price",
                      labelText: "Price"
                  ),
                ),
                TextField(
                  controller: timeout,
                  decoration: InputDecoration(
                      hintText: "Out",
                      labelText: "Out"
                  ),
                ),
                TextField(
                  controller: timein,
                  decoration: InputDecoration(
                      hintText: "In",
                      labelText: "In"
                  ),
                ),
                TextField(
                  controller: status,
                  decoration: InputDecoration(
                      hintText: "Status",
                      labelText: "Status"
                  ),
                ),
                SizedBox(height: 10,),
                RaisedButton(
                    onPressed: (){
                      editRent();
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context)=>ManageRent()));
                    },
                    child: Text("Edit Rent"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
