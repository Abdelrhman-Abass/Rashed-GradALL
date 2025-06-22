import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/widgets/index.dart';
import 'package:rashed/features/chat/ui/widgets/ai_message.dart';
import 'package:rashed/features/chat/ui/widgets/chat_field.dart';
import 'package:rashed/features/chat/ui/widgets/my_message.dart';
import 'package:rashed/features/chat/ui/widgets/options.dart';

import '../cubit/chat_cubit.dart';
import '../data/enum/chat_type.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key, required this.type, this.sessionId});

   final ChatType type;
   final String? sessionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..init(type, sessionId: sessionId),
      child: Scaffold(
        appBar: const MyAppBar(title: 'AI Chat', actions: [Options()]),
        body: BlocBuilder<ChatCubit, ChatState>(
          builder: (context, state) {
            final cubit = context.read<ChatCubit>();
            if(state is SessionLoading) return const Center(child: AppLoading());
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 43.w),
              child: Column(
                children: [
                  Expanded(
                    child: Builder(
                        builder: (context) {
                          if(state is MessagesLoading) return const Center(child: AppLoading());
                          if(cubit.messages.isEmpty) return const Center(child: AppText(translation: 'Send a message to start the chat'));
                          return ListView.separated(
                            reverse: true,
                            itemBuilder: (c, int index) {
                              final message = cubit.messages[index];
                              return message.isFromBot ? AiMessage(message: message) : MyMessage(message: message);
                            },
                            separatorBuilder: (c, i) => 40.heightBox,
                            itemCount: cubit.messages.length,
                          );
                        }
                    ),
                  ),
                  50.heightBox,
                  const ChatField(),
                  50.heightBox,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
