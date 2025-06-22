import 'package:rashed/core/utils/app_toast.dart';
import 'package:url_launcher/url_launcher.dart';

void contactUs() async {
  try {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'support@rashed.com',
      query: Uri.encodeFull('subject=Support Request - Rashed'),
    );
    await launchUrl(emailUri, mode: LaunchMode.externalApplication);
  } on Exception catch (e) {
    AppToast.toast(msg: e.toString());
  }
}
