import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/widgets/index.dart';
import 'package:rashed/features/home/cubit/home_cubit.dart';

import 'widgets/bottom_nav_bar.dart';

class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = context.read<HomeCubit>();
          return Scaffold(
            appBar: MyAppBar(title: cubit.title, back: false),
            bottomNavigationBar: const MyBottomNavBar(),
            body: PageView(controller: cubit.pageController, physics: const NeverScrollableScrollPhysics(), children: cubit.screens),
          );
        },
      ),
    );
  }
}
