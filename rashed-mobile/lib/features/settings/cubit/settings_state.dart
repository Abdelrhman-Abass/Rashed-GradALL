part of 'settings_cubit.dart';

@immutable
sealed class SettingsState {}

final class SettingsInitial extends SettingsState {}
final class ToggleNotification extends SettingsState {}

final class LogoutLoading extends SettingsState {}
final class LogoutDone extends SettingsState {}
