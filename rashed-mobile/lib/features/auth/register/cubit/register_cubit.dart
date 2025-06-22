import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rashed/features/auth/data/dto/register.dart';

import '../../../../core/resources/app_routes.dart';
import '../../../../core/utils/navigator.dart';
import '../../data/repositories/user_repository.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  GlobalKey<FormState> confPasswordKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confPasswordController = TextEditingController();

  register() async {
    if(validate) return;
    emit(RegisterLoading());
    final success = await UserRepository.register(RegisterDTO(
      username: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    ));
    if(success) popAllAndPushName(AppRoutes.home);
    emit(RegisterDone());
  }

  bool get validate {
    return !nameKey.currentState!.validate() ||
    !emailKey.currentState!.validate() ||
    !passwordKey.currentState!.validate() ||
    !confPasswordKey.currentState!.validate();
  }

  bool get checkMatch => passwordController.text == confPasswordController.text;
}
