import 'package:demo_flutter/bottom_navigation_bar.dart';
import 'package:demo_flutter/card.dart';
import 'package:demo_flutter/data/route_list.dart';
import 'package:demo_flutter/delegate_demo.dart';
import 'package:demo_flutter/demo_row.dart';
import 'package:demo_flutter/navogator_demo.dart';
import 'package:demo_flutter/staggered_grid_view.dart';
import 'package:demo_flutter/tabbar.dart';
// import 'package:demo_flutter/tabbar.dart';
import 'package:flutter/material.dart';

import 'navigator_route_demo.dart';
 
void main() {
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title of Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routers.firstRoute.url,
      routes: RouteList,
      navigatorObservers: [],
      // home: DemoTabbar(tabbarCount: 6),
      // home: DemoBottomNavigationBar(),
      // home: DemoRow(),
      // home: GridPage(),
      // home: MainPage(),
      // home: FirstPageRoute(),
    );
  }
}

