import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'core/utils/data/app_local_storage.dart';
// import 'core/utils/data/socket_service.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  WidgetsFlutterBinding.ensureInitialized();

  // SocketService.init();
  await AppLocalStorage.init();

  runApp(const Rashed());
}