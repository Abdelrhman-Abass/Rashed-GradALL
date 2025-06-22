import 'package:flutter/material.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/utils/navigator.dart';
import 'package:rashed/features/chat/data/enum/chat_type.dart';

import '../../../core/resources/index.dart';
import '../../../core/widgets/index.dart';
import 'widgets/action.dart';
import 'widgets/card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(translation: 'Popular AI model', style: AppTextStyles.medium_32),
          25.heightBox,
          SizedBox(
            height: 436.44.h,
            child: Row(
              children: [
                HomeCard(
                  onTap: () => pushName(AppRoutes.chat, arguments: ChatType.voice),
                  large: true,
                  color: AppColors.secondary,
                  icon: AppImages.star,
                  child: Column(
                    children: [
                      AppText(
                        translation: 'Using Your Voice Recordings to Discover Ideas',
                        style: AppTextStyles.medium_32,
                        color: AppColors.textDark,
                        maxLines: 4,
                      ),
                      16.heightBox,
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomImageView(imagePath: AppImages.glass, width: 100.w),
                          CustomImageView(imagePath: AppImages.voice, width: 42.w),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    HomeCard(
                      onTap: () => pushName(AppRoutes.chat, arguments: ChatType.file),
                      large: false,
                      color: AppColors.primaryDark,
                      icon: AppImages.image,
                      child: const ActionWidget(text: 'Search \nby file'),
                    ),
                    const Spacer(),
                    HomeCard(
                      onTap: () => pushName(AppRoutes.chat, arguments: ChatType.chat),
                      large: false,
                      color: AppColors.primary,
                      icon: AppImages.chat,
                      child: const ActionWidget(text: 'Start \nnew chat'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
