import 'package:flutter/material.dart';
import 'package:flutter_app/pages/c_fragment.dart';
import 'package:flutter_app/pages/home_fragment.dart';
import 'package:flutter_app/pages/b_fragment.dart';

void main() => runApp(BottomNavigationBarExample());

class BottomNavigationBarExample extends StatefulWidget {
  @override
  _BottomNavigationBarItemState createState() =>
      _BottomNavigationBarItemState();
}

class _BottomNavigationBarItemState extends State<BottomNavigationBarExample> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//          appBar: AppBar(
//            title: Text('My Flutter App'),
//          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: onTabTapped, // new
              items: [
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  title: new Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.mail),
                  title: new Text('Messages'),
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), title: Text('Profile'))
              ]),
          body: showBottomViewUI() //_children[_currentIndex],
          ),
    );
  }

  Widget showBottomViewUI() {
    return new IndexedStack(
        index: _currentIndex,
        alignment: Alignment.center,
        children: <Widget>[
          HomeFragment(),
          BFragment(),
          CFragment(),
        ]);
  }
}
