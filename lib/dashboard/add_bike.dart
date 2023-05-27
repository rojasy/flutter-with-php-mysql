import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddBike extends StatefulWidget {
  const AddBike({Key? key}) : super(key: key);

  @override
  State<AddBike> createState() => _AddBikeState();
}

class _AddBikeState extends State<AddBike> {

  TextEditingController bikeID=TextEditingController();
  TextEditingController bikeName= TextEditingController();

  void addBike(){
    var url="http://192.168.56.1/bikes/addbike.php";
    http.post(Uri.parse(url),headers: {
      'Accept':'application/json',
    },body: {
      "bikeID": bikeID.text,
      "bikeName": bikeName.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Bike"),),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                TextField(
                  controller: bikeID,
                  decoration: InputDecoration(
                    hintText: "Bike ID",
                    labelText: "Bike ID",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: bikeName,
                  decoration: InputDecoration(
                    hintText: "Bike Name",
                    labelText: "Bike Name",
                  ),
                ),
                SizedBox(height: 10,),
                RaisedButton(
                  onPressed: (){
                    addBike();
                    Navigator.of(context).pop();
                  },
                  child: Text("Add bike"),
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
