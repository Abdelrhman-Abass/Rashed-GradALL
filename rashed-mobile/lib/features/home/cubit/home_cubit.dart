import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rashed/features/profile/ui/profile_screen.dart';
import 'package:rashed/features/settings/ui/settings_screen.dart';

import '../ui/home_screen.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int selectedNav = 0;
  selectNav(int index) {
    selectedNav = index;
    pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.linear);
    emit(NavSelected());
  }

  String get title => titles[selectedNav];
  List<String> titles = [
    'RASHED',
    'Profile',
    'Settings',
  ];

  List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  PageController pageController = PageController();


}