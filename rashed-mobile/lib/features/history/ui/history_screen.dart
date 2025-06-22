import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rashed/core/helper/index.dart';
import 'package:rashed/core/widgets/app_loading.dart';
import 'package:rashed/core/widgets/app_text_display.dart';
import 'package:rashed/core/widgets/appbar.dart';
import 'package:rashed/features/history/cubit/history_cubit.dart';

import 'widgets/chat_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit()..getChats(),
      child: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) {
          final cubit = context.read<HistoryCubit>();
          return Scaffold(
            appBar: const MyAppBar(title: 'Chat History'),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 43.w),
              child: Builder(
                builder: (context) {
                  if(state is GetChatsLoading) return const Center(child: AppLoading());
                  if(cubit.chats.isEmpty) return const Center(child: AppText(translation: 'You don\'t have chats yet, Go start a chat'));
                  return ListView.separated(
                    itemBuilder: (c, index) => ChatWidget(chat: cubit.chats[index]),
                    separatorBuilder: (c, i) => 40.heightBox,
                    itemCount: cubit.chats.length,
                  );
                }
              ),
            ),
          );
        },
      ),
    );
  }
}
