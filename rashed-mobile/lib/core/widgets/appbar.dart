import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/resources/index.dart';
import 'package:flutter/material.dart';

import 'app_text_display.dart';
import 'custom_image_view.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key, this.back = true, this.centerTitle = true, this.title, this.actions, this.onBack, this.profile = true, this.leading});

  final void Function()? onBack;
  final bool back;
  final bool centerTitle;
  final String? title;
  final List<Widget>? actions;
  final bool profile;
  final String? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 170.h,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      leadingWidth: 110.w,
      leading: back && Navigator.of(context).canPop() ? InkWell(
        onTap: onBack ?? () => Navigator.pop(context),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            width: 77.w,
            height: 68.h,
            margin: EdgeInsetsDirectional.only(start: 33.w),
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: AppCorners.border_26,
            ),
            child: CustomImageView(
              imagePath: AppImages.back,
              width: 35.w,
              height: 25.h,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ) : null,
      centerTitle: centerTitle,
      title: AppText(translation: title, style: AppTextStyles.medium_40),
      actions: [
        ...?actions,
        50.widthBox,
      ],
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight * 2);
}
