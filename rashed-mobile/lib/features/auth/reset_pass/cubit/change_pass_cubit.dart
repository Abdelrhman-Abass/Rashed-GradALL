import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/navigator.dart';
import '../../data/dto/update.dart';
import '../../data/repositories/user_repository.dart';

part 'change_pass_state.dart';

class ChangePassCubit extends Cubit<ChangePassState> {
  ChangePassCubit() : super(ChangePassInitial());

  GlobalKey<FormState> oldPasswordKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  GlobalKey<FormState> confPasswordKey = GlobalKey<FormState>();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();

  changePass() async {
    if(validate) return;
    emit(ChangePassLoading());
    final success = await UserRepository.changePass(ChangePassDTO(
      oldPassword: oldPasswordController.text,
      newPassword: passwordController.text,
    ));
    if(success) pop();
    emit(ChangePassDone());
  }

  bool get validate {
    return !oldPasswordKey.currentState!.validate() ||
           !passwordKey.currentState!.validate() ||
           !confPasswordKey.currentState!.validate();
  }

  bool get checkMatch => passwordController.text == confPasswordController.text;
}
