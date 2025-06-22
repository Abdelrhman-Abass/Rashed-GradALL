import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/index.dart';

import '../cubit/settings_cubit.dart';
import '../data/enum/lang.dart';
import '../data/enum/theme.dart';
import 'widgets/settings_action.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.w),
            child: Column(
              children: [
                100.heightBox,
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFD6D2D2).withOpacity(.1),
                    borderRadius: AppCorners.border_24,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 25.h),
                  child: Column(
                    children: [
                      SettingAction(onTap: cubit.toggleLang, title: 'Language', subTitle: cubit.lang.value, icon: AppImages.language),
                      40.heightBox,
                      SettingAction(onTap: cubit.toggleTheme, title: 'Appearance', subTitle: cubit.theme.value, icon: AppImages.appearance),
                      40.heightBox,
                      SettingAction(
                        onTap: () => cubit.toggleNotification(!cubit.notification),
                        title: 'Notification',
                        icon: AppImages.notifications,
                        isSwitch: true,
                        switchValue: cubit.notification,
                        onSwitch: cubit.toggleNotification,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: AppCorners.border_24,
                    color: const Color(0xFFD6D2D2).withOpacity(.1),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 25.h),
                  child: SettingAction(loading: state is LogoutLoading, onTap: cubit.logout, title: 'Log Out', icon: AppImages.logout),
                ),
                110.heightBox,
              ],
            ),
          );
        },
      ),
    );
  }
}
