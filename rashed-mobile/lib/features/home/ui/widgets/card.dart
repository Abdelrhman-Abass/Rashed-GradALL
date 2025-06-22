import 'package:flutter/material.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/app_images_path.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/app_text_styles.dart';
import '../../../../core/widgets/custom_image_view.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.large, required this.color, required this.icon, required this.child, required this.onTap});

  final bool large;
  final Color color;
  final String icon;
  final Widget child;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: large ? 436.44.h : 200.h,
        width: large ? 290.w : 244.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: AppCorners.border_26,
          image: DecorationImage(image: AssetImage(large ? AppImages.mesh2 : AppImages.mesh3), fit: BoxFit.cover),
          boxShadow: [
            if(!large) const BoxShadow(color: Colors.white30, blurStyle: BlurStyle.inner, offset: Offset(-1, -1), blurRadius: 4),
            const BoxShadow(color: Colors.white54, blurStyle: BlurStyle.normal, offset: Offset(1, 1), blurRadius: 4),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.textDark.withOpacity(0.1),
                borderRadius: AppCorners.border_26,
              ),
              child: CustomImageView(imagePath: icon, fit: BoxFit.scaleDown),
            ),
            const Spacer(),
            child,
          ],
        ),
      ),
    );
  }
}
