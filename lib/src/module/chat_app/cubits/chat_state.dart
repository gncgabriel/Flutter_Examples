abstract class ChatState {}

class ChatStateLoading extends ChatState {}

class ChatStateError extends ChatState {}

class ChatStateInitial extends ChatState {}

class ChatStateSelected extends ChatState {
  final int chatId;
  final String personName;
  final String message;

  ChatStateSelected({
    required this.chatId,
    required this.personName,
    required this.message,
  });


}
