part of 'history_cubit.dart';

@immutable
sealed class HistoryState {}

final class HistoryInitial extends HistoryState {}

final class GetChatsLoading extends HistoryState {}
final class GetChatsDone extends HistoryState {}
