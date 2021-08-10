import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation/main.dart';
import 'package:animated_bottom_navigation/utils/bottom_navigation.dart';

import 'next route.dart';
class NavigationUi extends StatefulWidget{
  @override
  _NavigationUiState createState() => _NavigationUiState();
}

class _NavigationUiState extends State<NavigationUi> {

  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Hello"
        ),
      ),
      body: Container(
        child: Center(child: _getPage(currentPage))
      ),
      bottomNavigationBar: XBottomNavigation(
        tabs: [
          TabData(
            iconData: Icons.account_circle,
            title: "Account",
          onclick: () {
    final FancyBottomNavigationState fState = GlobalKey()
        .currentState as FancyBottomNavigationState;
    fState.setPage(2);
    }),

          TabData(
            iconData: Icons.shopping_basket,
              onclick: () => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SecondPage()))),
    TabData(iconData: Icons.camera, title: "Basket")
    ],
        initialSelection: 1,
        key: GlobalKey(),
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[Text("Hello"), Text("World")],
        ),
      ),
    );
  }
  _getPage(int fn ) {
    switch ( fn) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the home page"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            ),
            RaisedButton(
              child: Text(
                "Change to page 3",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                final FancyBottomNavigationState fState = GlobalKey()
                    .currentState as FancyBottomNavigationState;
                fState.setPage(2);
              },
            )
          ],
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is an asset "),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondPage()));
              },
            )
          ],
        );
      default:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is an icon"),
            RaisedButton(
              child: Text(
                "Start new page",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            )
          ],
        );
    }
  }
}

