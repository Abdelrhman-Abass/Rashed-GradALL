import 'package:flutter/material.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/index.dart';
import 'package:rashed/core/utils/navigator.dart';
import 'package:rashed/core/widgets/index.dart';

import '../../data/models/chat.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final isActive = (chat.isActive ?? false);
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () => pushName(AppRoutes.chat, arguments: chat.id),
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.textDark,
              border: Border.all(color: const Color(0xFFDDDDDD).withValues(alpha: .5), width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
            child: CustomImageView(imagePath: AppImages.book),
          ),
          12.widthBox,
          AppText(translation: chat.title, style: AppTextStyles.medium_32),
          const Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              borderRadius: AppCorners.border_24,
                color: (isActive ? const Color(0xFF689FFF) : const Color(0xFFFF0002)).withOpacity(0.1),
            ),
            child: AppText(translation: isActive ? 'Active' : 'Closed', style: AppTextStyles.regular_16, color: isActive ? const Color(0xFF689FFF) : const Color(0xFFFF0002)),
          ),
          35.widthBox,
          CustomImageView(imagePath: AppImages.arrow, width: 24.w, height: 24.h),
        ],
      ),
    );
  }
}
