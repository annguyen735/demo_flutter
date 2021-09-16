
import 'package:demo_flutter/data/route_data.dart';
import 'package:flutter/material.dart';
import 'enum.dart';

class Routes {
  static pushTo(BuildContext context, RouteObject route, { PushType? pushType, Object? arguments, Widget? widget, String? modalRoute}){
    switch (pushType) {
      case PushType.pushNamed:
        return Navigator.pushNamed(context, route.url, arguments: arguments);
      case PushType.pushReplacement:
        return Navigator.pushReplacementNamed(context, route.url, arguments: arguments);
      case PushType.pushAndRemoveUntil:
        if (modalRoute != null) {
          return Navigator.pushNamedAndRemoveUntil(context, route.url, ModalRoute.withName(modalRoute), arguments: arguments);
        }
          return Navigator.pushNamedAndRemoveUntil(context, route.url, (route) => false, arguments: arguments);
        default: 
          return Navigator.push(context, MaterialPageRoute(builder: (context) => route.widgetRedirect));
    }
  }
  
  static popTo(BuildContext context, { PopType? popType, RouteObject? route, Object? argument, String? modalRoute}) {
    switch (popType) {
      case PopType.popUntil:
        if (modalRoute == null) return Navigator.popUntil(context, (route) => false);
        return Navigator.popUntil(context, ModalRoute.withName(modalRoute));
      case PopType.popAndPushNamed:
        if (route == null) return ;
        return Navigator.popAndPushNamed(context, route.url, arguments: argument);
      case PopType.maybePop:
        return Navigator.maybePop(context);
      default: 
        return Navigator.pop(context, argument);
    }
  }
}