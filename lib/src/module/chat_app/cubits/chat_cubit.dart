import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/src/module/chat_app/cubits/chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatStateInitial());

  void selectChat(int id, String personName, String message) async {
    emit(ChatStateLoading());
    try {
      await Future.delayed(const Duration(milliseconds: 0));
      emit(
        ChatStateSelected(
          chatId: id,
          personName: personName,
          message: message,
        ),
      );
    } catch (_) {
      emit(ChatStateError());
    }
  }

  void clearState(){
    emit(ChatStateInitial());
  }
}
