import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/resources/app_images_path.dart';
import '../core/resources/app_routes.dart';
import '../core/utils/navigator.dart';
import '../core/widgets/custom_image_view.dart';
import 'auth/data/repositories/auth_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(seconds: 3), () async {
      if (AuthRepository.boarding) {
        popAllAndPushName(AppRoutes.onBoarding);
      } else if (AuthRepository.accessToken == null) {
        popAllAndPushName(AppRoutes.login);
      } else {
        popAllAndPushName(AppRoutes.home);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomImageView(imagePath: AppImages.logo, margin: EdgeInsets.all(30.r)),
      ),
    );
  }
}