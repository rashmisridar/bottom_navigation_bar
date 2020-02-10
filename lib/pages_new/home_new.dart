import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/b_fragment.dart';
import 'package:flutter_app/pages/c_fragment.dart';
import 'package:flutter_app/pages/d_fragment.dart';
import 'package:flutter_app/pages/home_fragment.dart';


void main()=>runApp(MaterialApp(

    home:HomeNew()));

class HomeNew extends StatefulWidget {
  @override
  _HomeNewState createState() => _HomeNewState();
}

class _HomeNewState extends State<HomeNew> {
  var _currentIndex=0;

  String mSelectedLocation= "Select location";

  onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      print("goToWidget2 ${index}");
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
        body: SafeArea(
            child: NestedScrollView(
              scrollDirection: Axis.vertical,
              dragStartBehavior: DragStartBehavior.start,
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    floating: true,
                    pinned: false,
                    snap: true,
                    elevation: 0.0,
                    backgroundColor: Colors.black,
                    actions: <Widget>[
                      IconButton(
                        onPressed: () {
                          //displayBottomSheet(context);
                        },
                        icon: Icon(
                          Icons.filter_list,
                          color: Colors.white,
                        ),
                      )
                    ],
                    // bottom:,
                    title: new Theme(
                      child: GestureDetector(
                        onTap: () {
                          //displayLocationDialog();
                          // setState(() {  });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              GestureDetector(
                               // onTap: _buttonTapped,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      mSelectedLocation,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                              Divider(
                                height: 0.0,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ),
                      data: new ThemeData.dark(),
                    ),
                    centerTitle: true,
                  )

                ];
              },
              body:showBottomViewUI(),
            )),
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.black,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            //   primaryColor: Colors.red,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.white))),
        child: BottomNavigationBar(
            selectedFontSize: 16.0,
            unselectedFontSize: 16.0,
            // fixedColor: Color(0xFFff7043),
            backgroundColor: Colors.black,
            currentIndex: 0,
            onTap: (int index) => {
              onTabTapped((index))
            },
            type: BottomNavigationBarType.fixed,
            // this will be set when a new tab is tapped
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
                  icon: Icon(Icons.person), title: Text('Profile')),

              BottomNavigationBarItem(
                  icon: Icon(Icons.add_location), title: Text('location'))

            ])),
    );
  }

  Widget showBottomViewUI() {
    return new IndexedStack(
      index: _currentIndex,
      alignment: Alignment.center,
      children: <Widget>[
        new HomeFragment(),
        new BFragment(),
        new CFragment(),
        new DFragment(),
      ],
    );
  }
}
