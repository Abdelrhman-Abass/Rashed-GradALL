import 'package:rashed/features/auth/data/repositories/user_repository.dart';

class ChangePassDTO {
  ChangePassDTO({
    this.oldPassword,
    this.newPassword,
  });

  final String? oldPassword;
  final String? newPassword;

  Map<String, dynamic> toJson() => {
    'email': UserRepository.user?.email,
    if(oldPassword != null) 'oldPassword': oldPassword,
    if(newPassword != null) 'newPassword': newPassword,
  };
}