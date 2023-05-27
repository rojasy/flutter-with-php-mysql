import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'edit_owner.dart';
import 'manage_owner.dart';

class OwnerDetails extends StatefulWidget {
  List list;
  int index;

  OwnerDetails({Key? key, required this.list, required this.index}) : super(key: key);


  @override
  State<OwnerDetails> createState() => _OwnerDetailsState();
}

class _OwnerDetailsState extends State<OwnerDetails> {

  void deleteOwner(){
    var url="http://192.168.56.1/bikes/deleteowner.php";
    http.post(Uri.parse(url),headers: {'Accept':'application/json'},body: {
      "ownerID": widget.list[widget.index]["ownerID"],
    });
  }

  void confirm(){
    AlertDialog alertDialog = AlertDialog(
      content: Text("Are you sure want to delete owner '${widget.list[widget.index]["firstname"]} ${widget.list[widget.index]["lastname"]} '?!"),
      actions: [
        RaisedButton(
          onPressed: (){
            deleteOwner();
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ManageOwner()));
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
                Text("gender: ${widget.list[widget.index]["gender"]}",style: TextStyle(fontSize: 18),),
                Text("phone: ${widget.list[widget.index]["phone"]}",style: TextStyle(fontSize: 18),),
                Text("address: ${widget.list[widget.index]["address"]}",style: TextStyle(fontSize: 18),),
                Text("nationality: ${widget.list[widget.index]["nationality"]}",style: TextStyle(fontSize: 18),),
                Text("password: ${widget.list[widget.index]["password"]}",style: TextStyle(fontSize: 18),),
                Padding(padding: EdgeInsets.only(top: 10)),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RaisedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>EditOwner(list: widget.list,index: widget.index,)));
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
