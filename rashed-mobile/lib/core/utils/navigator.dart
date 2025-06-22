import 'package:flutter/material.dart';


void pop({BuildContext? context, dynamic result}) {
  if(ModalRoute.of(context??navigatorKey.currentContext!)?.isCurrent != true) Navigator.pop(context??navigatorKey.currentContext!, result);
}
void openDrawer(BuildContext context)=>  Scaffold.of(context).openDrawer();

pushPage(Widget widget, {BuildContext? context}) {
  return Navigator.of(context??navigatorKey.currentContext!).push(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
  );
}

void popAllAndPushPage(Widget widget, {BuildContext? context}) {
  Navigator.of(context??navigatorKey.currentContext!).pushAndRemoveUntil(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
    (Route<dynamic> route) => false,
  );
}

void popAllAndPushName(String widget, {
  BuildContext? context,
  RoutePredicate? condition,
  Object? arguments,
}) {
  Navigator.of(context??navigatorKey.currentContext!).pushNamedAndRemoveUntil(widget, condition ?? (Route<dynamic> route) => false, arguments: arguments);
}

Future<dynamic> pushName(String route, {dynamic arguments, BuildContext? context}) {
  return Navigator.of(context??navigatorKey.currentContext!).pushNamed(route, arguments: arguments);
}

Future<dynamic> pushNameForResult(BuildContext context, String route) {
  return Navigator.of(context).pushNamed(route);
}

Future<dynamic> pushNameWithArgumentsForResult(BuildContext context, String route, dynamic argument) {
  return Navigator.of(context).pushNamed(route, arguments: argument);
}

void pushNameWithArguments(BuildContext context, String route, dynamic argument) {
  Navigator.of(context).pushNamed(route, arguments: argument);
}

void dismissKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
  FocusScope.of(context).requestFocus(FocusNode());
}

void pushNameReplacement(String route, {BuildContext? context, dynamic arguments}) {
  Navigator.of(context ?? navigatorKey.currentContext!).pushReplacementNamed(route, arguments: arguments);
}

void pushReplacement(Widget widget, {BuildContext? context, dynamic arguments}) {
  Navigator.of(context ?? navigatorKey.currentContext!).pushReplacement(
    MaterialPageRoute<dynamic>(builder: (BuildContext context) => widget),
  );
}

void pushPageRoute<T>(BuildContext context, Route<T> route) {
  Navigator.of(context).push(route);
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
