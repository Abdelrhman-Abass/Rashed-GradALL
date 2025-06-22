import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/utils/navigator.dart';
import 'package:rashed/core/utils/validation_functions.dart';
import 'package:rashed/features/auth/register/cubit/register_cubit.dart';

import '../../../../core/helper/index.dart';
import '../../../../core/widgets/index.dart';
import '../../../../core/resources/index.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocBuilder<RegisterCubit, RegisterState>(
        builder: (context, state) {
          final cubit = context.read<RegisterCubit>();
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 43.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    122.heightBox,
                    CustomImageView(imagePath: AppImages.logo, width: 263.w),
                    Align(alignment: AlignmentDirectional.centerStart, child: AppText(translation: 'Sign up', style: AppTextStyles.bold_44)),
                    50.heightBox,
                    CustomTextFormField(
                      formKey: cubit.nameKey,
                      controller: cubit.nameController,
                      hintText: 'Full Name',
                      prefix: AppImages.user,
                      validator: (v) => validateText(v, 'Name'),
                    ),
                    20.heightBox,
                    CustomTextFormField(
                      formKey: cubit.emailKey,
                      controller: cubit.emailController,
                      hintText: 'Email',
                      prefix: AppImages.email,
                      textInputType: TextInputType.emailAddress,
                      validator: validateEmail,
                    ),
                    20.heightBox,
                    CustomTextFormField(
                      formKey: cubit.passwordKey,
                      controller: cubit.passwordController,
                      hintText: 'Password',
                      prefix: AppImages.lock,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.visiblePassword,
                      validator: validatePassword,
                      obscureText: true,
                    ),
                    20.heightBox,
                    CustomTextFormField(
                      formKey: cubit.confPasswordKey,
                      controller: cubit.confPasswordController,
                      hintText: 'Confirm Password',
                      prefix: AppImages.lock,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      validator: (v) => validateConfPassword(v, context.read<RegisterCubit>().checkMatch),
                      obscureText: true,
                    ),
                    50.heightBox,
                    AppButton(
                      onTap: context.read<RegisterCubit>().register,
                      isLoading: state is RegisterLoading,
                      height: 70.h,
                      translation: 'Sign up',
                      color: Colors.white,
                      textColor: Colors.black,
                      style: AppTextStyles.bold_36,
                    ),
                    250.heightBox,
                    GestureDetector(
                      onTap: pop,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(translation: 'Already have an account? ', style: AppTextStyles.regular_24),
                          AppText(translation: 'Sign in', style: AppTextStyles.bold_24),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
