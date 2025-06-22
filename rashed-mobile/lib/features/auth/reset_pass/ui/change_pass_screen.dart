import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/index.dart';
import '../../../../core/widgets/index.dart';
import '../../../../core/resources/index.dart';
import '../../../../core/utils/validation_functions.dart';
import '../cubit/change_pass_cubit.dart';

class ChangePassScreen extends StatelessWidget {
  const ChangePassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePassCubit(),
      child: BlocBuilder<ChangePassCubit, ChangePassState>(
        builder: (context, state) {
          final cubit = context.read<ChangePassCubit>();
          return Scaffold(
            resizeToAvoidBottomInset: true,
            appBar: const MyAppBar(title: 'Change Password'),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 43.w),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    160.heightBox,
                    CustomTextFormField(
                      formKey: cubit.oldPasswordKey,
                      controller: cubit.oldPasswordController,
                      hintText: 'Old Password',
                      prefix: AppImages.lock,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.visiblePassword,
                      validator: validatePassword,
                      obscureText: true,
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
                      validator: (v) => validateConfPassword(v, cubit.checkMatch),
                      obscureText: true,
                    ),
                    50.heightBox,
                    AppButton(
                      onTap: cubit.changePass,
                      isLoading: state is ChangePassLoading,
                      height: 70.h,
                      translation: 'Change Password',
                      color: Colors.white,
                      textColor: Colors.black,
                      style: AppTextStyles.bold_36,
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
