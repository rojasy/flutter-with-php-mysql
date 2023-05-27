import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'edit_rent.dart';
import 'manage_rent.dart';

class RentDetails extends StatefulWidget {

  List list;
  int index;

   RentDetails({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  State<RentDetails> createState() => _RentDetailsState();
}

class _RentDetailsState extends State<RentDetails> {


  void deleteData(){
    var url="http://192.168.56.1/bikes/deletedata.php";
    http.post(Uri.parse(url),headers: {'Accept':'application/json'},body: {
      "rentID": widget.list[widget.index]["rentID"],
    });
  }

  void confirm(){
    AlertDialog alertDialog = AlertDialog(
      content: Text("Are you sure want to delete '${widget.list[widget.index]["firstname"]} ${widget.list[widget.index]["lastname"]} '?!"),
      actions: [
        RaisedButton(
            onPressed: (){
              deleteData();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ManageRent()));
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
      appBar: AppBar(title: Text("${widget.list[widget.index]["firstname"]} ${widget.list[widget.index]["lastname"]}"),),
      body: Container(
        // height: 250,
        padding: EdgeInsets.all(20),
        child: Card(
          child: Center(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 10)),
                Text("${widget.list[widget.index]["firstname"]} ${widget.list[widget.index]["lastname"]}",style: TextStyle(fontSize: 20),),
                Text("Owner: ${widget.list[widget.index]["ownerID"]}",style: TextStyle(fontSize: 18),),
                Text("Bike: ${widget.list[widget.index]["name"]}",style: TextStyle(fontSize: 18),),
                Text("Time: ${widget.list[widget.index]["time"]}",style: TextStyle(fontSize: 18),),
                Text("Price: ${widget.list[widget.index]["price"]}",style: TextStyle(fontSize: 18),),
                Text("Out: ${widget.list[widget.index]["time_out"]}",style: TextStyle(fontSize: 18),),
                Text("In: ${widget.list[widget.index]["time_in"]}",style: TextStyle(fontSize: 18),),
                Text("Status: ${widget.list[widget.index]["status"]}",style: TextStyle(fontSize: 18),),
                Padding(padding: EdgeInsets.only(top: 10)),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                        onPressed: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditRent(list: widget.list,index: widget.index,)));
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
