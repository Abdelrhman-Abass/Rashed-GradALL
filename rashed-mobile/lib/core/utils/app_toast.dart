import 'package:fluttertoast/fluttertoast.dart';


class AppToast{
  static void toast({required String msg}) => Fluttertoast.showToast(msg: msg);
  static void removeToast() => Fluttertoast.cancel();
}