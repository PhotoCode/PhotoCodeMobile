import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  @override
  EditScreenState createState() => EditScreenState();
}

class EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
