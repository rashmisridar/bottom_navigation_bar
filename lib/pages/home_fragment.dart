import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Fragment'),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Home Fragment",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
