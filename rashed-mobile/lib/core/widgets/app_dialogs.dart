import 'package:rashed/core/resources/app_routes.dart';
import 'package:rashed/core/resources/app_text_styles.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import '../helper/index.dart';
import '../utils/navigator.dart';

class AppDialogs {
  static Future<void> showErrorDialog(BuildContext context, {
    String error = 'there_was_an_error',
    String okText = 'try_again',
    bool dismissible = true,
    canPop = true,
    void Function()? onOkTap
  }) async {
    await AwesomeDialog(
      context: context,
      animType: AnimType.bottomSlide,
      padding: EdgeInsets.zero,
      dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Text(error, style: AppTextStyles.bold_44),
      ),
      btnOkHeight: 30.h,
      btnOkText: okText,
      btnOkColor: Theme.of(context).primaryColor,
      btnOkOnPress: onOkTap ?? () => canPop ? pop() : popAllAndPushName(AppRoutes.login),
      dialogType: DialogType.error,
      dismissOnBackKeyPress: dismissible,
      dismissOnTouchOutside: dismissible,
    ).show();
  }


  static Future<void> showDialog(BuildContext context, {
    String? okText,
    bool dismissible = true,
    void Function()? onOkTap,
    Widget? body
  }) async{
    await AwesomeDialog(
      context: context,
      animType: AnimType.bottomSlide,
      padding: EdgeInsets.zero,
      outterPadding: EdgeInsets.symmetric(horizontal: 20.w),
      bodyHeaderDistance: 0.0,
      dialogBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: body,
      btnOkText: okText,
      btnOkColor: Theme.of(context).primaryColor,
      btnOkOnPress: onOkTap,
      dialogType: DialogType.noHeader,
      dismissOnBackKeyPress: dismissible,
      dismissOnTouchOutside: dismissible,
    ).show();
  }
}
