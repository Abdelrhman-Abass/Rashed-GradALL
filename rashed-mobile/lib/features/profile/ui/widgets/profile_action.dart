import 'package:flutter/material.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/index.dart';
import 'package:rashed/core/widgets/index.dart';

class ProfileAction extends StatelessWidget {
  const ProfileAction({super.key, required this.title, required this.icon, required this.onTap});

  final String title;
  final String icon;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Row(
        children: [
          CustomImageView(imagePath: icon, width: 50.w, height: 50.h, fit: BoxFit.scaleDown),
          13.widthBox,
          AppText(translation: title, style: AppTextStyles.semi_32),
          const Spacer(),
          CustomImageView(imagePath: AppImages.arrow, width: 24.w, height: 24.h),
        ],
      ),
    );
  }
}
