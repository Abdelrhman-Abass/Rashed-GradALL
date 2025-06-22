import 'package:flutter/material.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/index.dart';
import 'package:rashed/core/widgets/index.dart';

class SettingAction extends StatelessWidget {
  const SettingAction({super.key, required this.title, required this.icon, required this.onTap, this.isSwitch = false, this.switchValue, this.onSwitch, this.subTitle, this.loading = false});

  final String title;
  final String? subTitle;
  final String icon;

  final GestureTapCallback onTap;
  final bool isSwitch;
  final bool? switchValue;
  final Function(bool value)? onSwitch;

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Row(
        children: [
          CustomImageView(imagePath: icon, width: 50.w, height: 50.h, fit: BoxFit.scaleDown),
          23.widthBox,
          AppText(translation: title, style: AppTextStyles.medium_25),
          const Spacer(),
          if(subTitle != null) ... [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: AppCorners.border_24,
                color: const Color(0xFF689FFF).withOpacity(0.1),
              ),
              child: AppText(translation: subTitle!, style: AppTextStyles.regular_16, color: const Color(0xFF689FFF)),
            ),
            35.widthBox,
          ],
          isSwitch ? CustomSwitch(onChange: onSwitch ?? (v) => onTap(), value: switchValue, ) : loading ? AppLoading(size: 30.sp) : CustomImageView(imagePath: AppImages.arrow, width: 24.w, height: 24.h),
        ],
      ),
    );
  }
}
