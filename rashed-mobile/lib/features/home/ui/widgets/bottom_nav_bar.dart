import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/app_colors.dart';
import 'package:rashed/core/resources/app_images_path.dart';
import 'package:rashed/core/resources/app_text_styles.dart';
import 'package:rashed/core/widgets/custom_image_view.dart';
import 'package:rashed/features/home/cubit/home_cubit.dart';

import '../../../../core/widgets/app_text_display.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final selectedIndex = cubit.selectedNav;
        final double fullWidth = 1.sw - (155.w * 2);
        final double itemWidth = (fullWidth / 3) + 33.w + (selectedIndex * 7);

        return Container(
          margin: EdgeInsets.symmetric(horizontal: 155.w).add(EdgeInsets.only(bottom: 20.h)),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: const Color(0xFFD6D2D2).withOpacity(.1),
            image: DecorationImage(image: AssetImage(AppImages.meshNav), fit: BoxFit.cover),
            borderRadius: AppCorners.border_26,
          ),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                left: selectedIndex * fullWidth / 4.5,
                top: 0,
                bottom: 0,
                child: Container(
                  width: itemWidth + selectedIndex,
                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: AppColors.grayDark.withOpacity(0.3),
                    borderRadius: AppCorners.border_26,
                  ),
                ),
              ),

              // Row of items
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildItem(context, icon: AppImages.home, label: "Home", index: 0),
                  _buildItem(context, icon: AppImages.profile, label: 'Profile', index: 1),
                  _buildItem(context, icon: AppImages.settings, label: 'Settings', index: 2),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildItem(BuildContext context, {required String icon, String? label, required int index}) {
    final cubit = context.read<HomeCubit>();
    final bool isSelected = index == cubit.selectedNav;

    return GestureDetector(
      onTap: () => cubit.selectNav(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        child: Row(
          children: [
            Container(
              width: isSelected ? 50.w : 44.w,
              height: isSelected ? 50.h : 44.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected
                    ? AppColors.primaryDark
                    : AppColors.grayDark.withOpacity(0.3),
                image: isSelected
                    ? DecorationImage(image: AssetImage(AppImages.mesh2), fit: BoxFit.cover)
                    : null,
              ),
              child: CustomImageView(
                imagePath: icon,
                color: isSelected ? AppColors.textDark : AppColors.gray.withOpacity(.8),
                fit: BoxFit.scaleDown,
                margin: EdgeInsets.all(8.r),
              ),
            ),
            if (isSelected && label != null) ...[
              12.widthBox,
              AppText(
                translation: label,
                style: AppTextStyles.medium_24,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
