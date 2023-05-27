import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'manage_bike.dart';

class EditBike extends StatefulWidget {
  List list;
  int index;
  EditBike({required this.list,required this.index,Key? key}) : super(key: key);

  @override
  State<EditBike> createState() => _EditBikeState();
}

class _EditBikeState extends State<EditBike> {

  late TextEditingController bikeID;
  late TextEditingController name;

  void editBike(){
    var url="http://192.168.56.1/bikes/editbike.php";
    http.post(Uri.parse(url),headers: {'Accept':'application/json',},body: {
      "bikeID": widget.list[widget.index]["bikeID"],
      "name":name.text,
    });
  }

  @override
  void initState() {
    bikeID= TextEditingController(text: widget.list[widget.index]["bikeID"]);
    name= TextEditingController(text: widget.list[widget.index]["name"]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Bike"),),
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
                      labelText: "Bike ID"
                  ),
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                      hintText: "Bike Name",
                      labelText: "Bike Name"
                  ),
                ),

                SizedBox(height: 10,),
                RaisedButton(
                  onPressed: (){
                    editBike();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>ManageBike()));
                  },
                  child: Text("Edit Bike"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
