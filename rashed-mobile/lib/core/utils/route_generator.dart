import 'package:flutter/material.dart';
import 'package:rashed/features/auth/login/ui/login_screen.dart';
import 'package:rashed/features/auth/reset_pass/ui/change_pass_screen.dart';
import 'package:rashed/features/chat/data/enum/chat_type.dart';
import 'package:rashed/features/chat/ui/chat_screen.dart';
import 'package:rashed/features/home/ui/home_layout.dart';
import 'package:rashed/features/on_boarding.dart';

import '../../features/auth/register/ui/register_screen.dart';
import '../../features/history/ui/history_screen.dart';
import '../../features/splash_screen.dart';
import '../resources/app_routes.dart';

class RouteGenerator{
  static Route? generateRoute(RouteSettings settings){
    final dynamic args = settings.arguments;
    debugPrint(args.toString());

    switch (settings.name){

      case AppRoutes.splash:
        return _screenRedirect(const SplashScreen());

      case AppRoutes.onBoarding:
        return _screenRedirect(const OnBoarding());

      case AppRoutes.login:
        return _screenRedirect(const LoginScreen());

      case AppRoutes.register:
        return _screenRedirect(const RegisterScreen());

      case AppRoutes.home:
        return _screenRedirect(const HomeScreenLayout());

      case AppRoutes.changePass:
        return _screenRedirect(const ChangePassScreen());

      case AppRoutes.chat:
        if(args is String) return _screenRedirect(ChatScreen(type: ChatType.chat, sessionId: args));
        return _screenRedirect(ChatScreen(type: args));

      case AppRoutes.history:
        return _screenRedirect(const HistoryScreen());

      default:
        return _errorRoute();

    }
  }

  static MaterialPageRoute<dynamic> _screenRedirect(Widget screen) {
    return MaterialPageRoute<dynamic>(builder: (_) => screen);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('No Route Found', style: TextStyle(color: Colors.white)),
        ),
      );
    });
  }
}
