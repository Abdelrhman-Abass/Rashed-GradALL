import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:rashed/core/resources/app_routes.dart';
import 'package:rashed/core/utils/navigator.dart';
import 'package:rashed/features/auth/data/dto/login.dart';
import 'package:rashed/features/auth/data/repositories/user_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    if(!emailKey.currentState!.validate() || !passwordKey.currentState!.validate()) return;
    emit(LoginLoading());
    final success = await UserRepository.login(LoginDTO(
      email: emailController.text,
      password: passwordController.text,
    ));
    if(success) popAllAndPushName(AppRoutes.home);
    emit(LoginDone());
  }
}
