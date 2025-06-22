import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/widgets/custom_image_view.dart';
import 'package:rashed/core/widgets/custom_text_form_field.dart';
import 'package:rashed/features/chat/cubit/chat_cubit.dart';

import '../../../../core/resources/index.dart';
import '../../services/attach_file.dart';

class ChatField extends StatelessWidget {
  const ChatField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                controller: cubit.chatController,
                hintText: 'Ask me anything...',
                hintStyle: AppTextStyles.regular_20,
                borderColor: const Color(0xFFDDDDDD).withValues(alpha: .1),
                borderRadius: 18.r,
                borderWidth: 1,
                filled: true,
                fillColor: const Color(0xFFD6D2D2).withValues(alpha: 0.1),
                contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                onChanged: cubit.onChanged,
                suffix: CustomImageView(
                  onTap: () => attachPdf(cubit),
                  imagePath: AppImages.attach,
                  margin: EdgeInsetsDirectional.only(end: 10.w),
                ),
              ),
            ),
            15.widthBox,
            GestureDetector(
              onTap: () {
                if(cubit.chatController.text.isNotEmpty) {
                  cubit.sendMessage();
                } else {
                  cubit.speechToText.isNotListening ? cubit.startListening() : cubit.stopListening();
                }
              },
              child: Container(
                width: 85.w, height: 75.h,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2C26),
                  image: DecorationImage(image: AssetImage(AppImages.mesh1), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(26.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: cubit.chatController.text.isEmpty
                    ? CustomImageView(imagePath: AppImages.voice, width: 45.h, height: 40.h, color: cubit.speechToText.isNotListening ? AppColors.textLight : AppColors.primary)
                    : CustomImageView(imagePath: AppImages.send, fit: BoxFit.scaleDown, color: AppColors.textLight),
              ),
            ),
          ],
        );
      },
    );
  }
}
