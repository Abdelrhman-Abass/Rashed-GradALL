import 'package:url_launcher/url_launcher.dart';
import 'package:rashed/core/utils/app_toast.dart';

void privacyPolicy() async {
  try {
    final Uri url = Uri.parse('https://privacyterms.io/view/v5Zsi0fJ-Q9sIUMMq-emk2Gd/');
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } on Exception catch (e) {
    AppToast.toast(msg: e.toString());
  }
}
