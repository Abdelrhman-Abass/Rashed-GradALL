import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rashed/core/resources/app_colors.dart';

import 'core/utils/navigator.dart';
import 'core/resources/app_routes.dart';
import 'core/utils/route_generator.dart';

class Rashed extends StatelessWidget {
  const Rashed({super.key});

  MaterialColor get getMaterialColor {
    final color = AppColors.primary;
    Map<int, Color> colorSwatch = {
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color,
    };
    return MaterialColor(color.value, colorSwatch);
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(660, 1355),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Rashed',
          themeMode: ThemeMode.dark,
          darkTheme: ThemeData(primaryColor: AppColors.primary, primarySwatch: getMaterialColor, scaffoldBackgroundColor: Colors.black),
          debugShowCheckedModeBanner: false,

          initialRoute: AppRoutes.splash,
          onGenerateRoute: RouteGenerator.generateRoute,

          navigatorKey: navigatorKey,
        );
      },
    );
  }
}

