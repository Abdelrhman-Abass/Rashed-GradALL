import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/utils/navigator.dart';
import 'package:rashed/features/chat/cubit/chat_cubit.dart';

import '../../../../core/resources/index.dart';
import '../../../../core/widgets/index.dart';

class Options extends StatelessWidget {
  const Options({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return PopupMenuButton(
      color: const Color(0xFF333936),
      position: PopupMenuPosition.under,
      padding: EdgeInsetsGeometry.zero,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(onTap: () => cubit.startNewSession(), child: const AppText(text: 'Start new Chat')),
        PopupMenuItem(onTap: () => pushName(AppRoutes.history), child: const AppText(text: 'Chat History')),
      ],
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          width: 77.w, height: 67.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color(0xFF1E2C26),
            borderRadius: AppCorners.border_26,
          ),
          child: CustomImageView(
            imagePath: AppImages.option,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
