import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'edit_bike.dart';
import 'manage_bike.dart';

class bikeDetails extends StatefulWidget {
  List list;
  int index;

  bikeDetails({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  State<bikeDetails> createState() => _bikeDetailsState();
}

class _bikeDetailsState extends State<bikeDetails> {

  void deleteBike(){
    var url="http://192.168.56.1/bikes/deletebike.php";
    http.post(Uri.parse(url),headers: {'Accept':'application/json'},body: {
      "bikeID": widget.list[widget.index]["bikeID"],
    });
  }

  void confirm(){
    AlertDialog alertDialog = AlertDialog(
      content: Text("Are you sure want to delete '${widget.list[widget.index]["name"]} '?!"),
      actions: [
        RaisedButton(
          onPressed: (){
            deleteBike();
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ManageBike()));
          },
          child: Text("OK"),
          color: Colors.red,
        ),
        RaisedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("CANCEL"),
          color: Colors.green,
        ),
      ],
    );
    showDialog(context: context, builder: (BuildContext context) { return alertDialog; }, );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.list[widget.index]["name"])),
      body: Container(
        // height: 250,
        padding: EdgeInsets.all(20),
        child: Card(
          child: Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                Text("Name: ${widget.list[widget.index]["name"]}",style: TextStyle(fontSize: 20),),
                Text("ID: ${widget.list[widget.index]["bikeID"]}",style: TextStyle(fontSize: 18),),

                Padding(padding: EdgeInsets.only(top: 10)),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditBike(list: widget.list,index: widget.index,)));
                      },
                      child: Text("EDIT"),
                      color: Colors.green,
                    ),
                    SizedBox(width: 10,),
                    RaisedButton(
                      onPressed: (){
                        confirm();
                      },
                      child: Text("DELETE"),
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
