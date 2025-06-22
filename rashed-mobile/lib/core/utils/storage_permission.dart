import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> checkStoragePermission() async {
  if (Platform.isAndroid) {
    if (await DeviceInfoPlugin().androidInfo.then((info) => info.version.sdkInt) >= 30) {
      // Android 11+ - Use MANAGE_EXTERNAL_STORAGE
      return await Permission.manageExternalStorage.request().isGranted;
    } else {
      // Android <11 - Use regular storage permission
      return await Permission.storage.request().isGranted;
    }
  } else if (Platform.isIOS) {
    // iOS uses different permission model
    return await Permission.photos.request().isGranted;
  }
  return false;
}