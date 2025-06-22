import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/utils/navigator.dart';
import 'package:rashed/core/utils/validation_functions.dart';
import 'package:rashed/features/auth/login/cubit/login_cubit.dart';

import '../../../../core/helper/index.dart';
import '../../../../core/widgets/index.dart';
import '../../../../core/resources/index.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          final cubit = context.read<LoginCubit>();
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 43.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    122.heightBox,
                    CustomImageView(imagePath: AppImages.logo, width: 263.w),
                    Align(alignment: AlignmentDirectional.centerStart, child: AppText(translation: 'Sign in', style: AppTextStyles.bold_44)),
                    50.heightBox,
                    CustomTextFormField(
                      formKey: cubit.emailKey,
                      controller: cubit.emailController,
                      hintText: 'Email or username',
                      prefix: AppImages.user,
                      textInputType: TextInputType.emailAddress,
                      validator: validateEmail,
                    ),
                    20.heightBox,
                    CustomTextFormField(
                      formKey: cubit.passwordKey,
                      controller: cubit.passwordController,
                      hintText: 'Password',
                      prefix: AppImages.lock,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.visiblePassword,
                      validator: validatePassword,
                      obscureText: true,
                    ),
                    50.heightBox,
                    AppButton(
                      onTap: cubit.login,
                      isLoading: state is LoginLoading,
                      height: 70.h,
                      translation: 'Sign in',
                      color: Colors.white,
                      textColor: Colors.black,
                      style: AppTextStyles.bold_36,
                    ),
                    470.heightBox,
                    GestureDetector(
                      onTap: () => pushName(AppRoutes.register),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(translation: 'Don\'t have account? ', style: AppTextStyles.regular_24),
                          AppText(translation: 'Sign Up', style: AppTextStyles.bold_24),
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
