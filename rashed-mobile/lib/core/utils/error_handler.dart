import 'app_toast.dart';

class ErrorHandler {
  static show(Map<String, dynamic> data) {
    AppToast.toast(msg: _parseError(data));
  }

  static String _parseError(Map<String, dynamic> json) {
    if (json['error'] != null) {
      if (json['error'] is Map) {
        return json['error']['message'] ?? 'Unknown Error Occurred';
      } else {
        return json['error_description'] ?? json['error'];
      }
    }
    return json['error_description'] ?? 'Unknown Error Occurred';
  }
}
