import 'package:demo_flutter/data/route_data.dart';
import 'package:demo_flutter/navigator_route_demo.dart';
import 'package:flutter/material.dart';

class Routers {
  static RouteObject firstRoute = RouteObject('/fisrt', FirstPageRoute());
  static RouteObject secondRoute = RouteObject('/second', SecondPageRoute());
  static RouteObject thirdRoute = RouteObject('/third', ThirdPageRoute());
  static RouteObject fourthRoute = RouteObject('/fourth', FourThPageRoute());
}

final List<RouteObject> routes = [
  Routers.firstRoute,
  Routers.secondRoute,
  Routers.thirdRoute,
  Routers.fourthRoute,
];

final Map<String, WidgetBuilder> RouteList = Map.fromIterable(routes, key: (e) => e.url, value: (e) => (context) => e.widgetRedirect);
