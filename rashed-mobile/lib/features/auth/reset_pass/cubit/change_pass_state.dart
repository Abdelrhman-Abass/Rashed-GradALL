part of 'change_pass_cubit.dart';

@immutable
sealed class ChangePassState {}

final class ChangePassInitial extends ChangePassState {}
final class ChangePassLoading extends ChangePassState {}
final class ChangePassDone extends ChangePassState {}
