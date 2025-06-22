import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rashed/features/chat/data/repository/chat_repository.dart';

import '../data/models/chat.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit() : super(HistoryInitial());

  List<Chat> chats = [];
  getChats() async {
    emit(GetChatsLoading());
    chats = await ChatRepository.getHistory();
    emit(GetChatsDone());
  }
}
