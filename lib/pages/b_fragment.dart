import 'package:flutter/material.dart';

class BFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('b Fragment'),
      ),
      body: Center(
        child: Container(
          child: Text(
            "B Fragment",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
