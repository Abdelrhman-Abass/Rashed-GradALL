part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}
final class TextChanged extends ChatState {}

final class SessionLoading extends ChatState {}
final class SessionDone extends ChatState {}

final class MessagesLoading extends ChatState {}
final class MessagesDone extends ChatState {}

final class MessageCreated extends ChatState {}
final class MessageSent extends ChatState {}

final class ExportLoading extends ChatState {
  final String id;
  ExportLoading(this.id);
}
final class ExportDone extends ChatState {}

final class SpeechState extends ChatState {}
final class InitSpeech extends ChatState {}

final class StartListening extends ChatState {}
final class StopListening extends ChatState {}
