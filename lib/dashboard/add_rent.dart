import 'package:flutter/material.dart';

class AddRent extends StatefulWidget {
  const AddRent({Key? key}) : super(key: key);

  @override
  State<AddRent> createState() => _AddRentState();
}

class _AddRentState extends State<AddRent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Rent"),),
      body: Center(child: Text("Add Rent"),),
    );
  }
}
