import 'package:flutter/material.dart';

import '../core/helper/index.dart';
import '../core/widgets/index.dart';
import '../core/resources/index.dart';
import '../core/utils/navigator.dart';
import 'auth/data/repositories/auth_repository.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.r),
        child: Column(
          children: [
            135.heightBox,
            AppText(translation: 'Hello there 👋', style: AppTextStyles.regular_40),
            AppText(translation: 'I\'m your friendly AI assistant', style: AppTextStyles.regular_30),
            120.heightBox,
            CustomImageView(imagePath: AppImages.logo, width: double.infinity),
            110.heightBox,
            AppText(translation: 'I\'m pleased that I met you! How can I help you right now?', style: AppTextStyles.regular_24, maxLines: 3, textAlign: TextAlign.center),
            50.heightBox,
            AppButton(
              height: 85.h,
              onTap: () {
                AuthRepository.setBoarding();
                if (AuthRepository.accessToken == null) {
                  popAllAndPushName(AppRoutes.login);
                } else {
                  popAllAndPushName(AppRoutes.home);
                }
              },
              translation: 'Get Started',
              textColor: AppColors.textDark,
              backgroundImage: AppImages.mesh1,
            ),
          ],
        ),
      ),
    );
  }
}
