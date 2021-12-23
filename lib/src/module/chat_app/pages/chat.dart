import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/src/module/chat_app/cubits/chat_cubit.dart';
import 'package:flutter_examples/src/module/chat_app/cubits/chat_state.dart';
import 'package:flutter_examples/src/module/chat_app/mocks/chat.json.dart';
import 'package:flutter_examples/src/module/chat_app/pages/states/clean_chat.dart';
import 'package:flutter_examples/src/module/chat_app/pages/states/selected_chat.dart';
import 'package:flutter_examples/src/shared/constants/routes.dart';
import 'package:flutter_examples/src/shared/utils/screen_size.dart';

class ChatApp extends StatefulWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ChatCubit>(
          create: (_) => ChatCubit(),
        )
      ],
      child: (ScreenSizeUtils.isDesktopScreen(context))
          ? const _Home()
          : const _MobileHome(),
    );
  }
}

class _Home extends StatelessWidget {
  const _Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: const [
          Expanded(
            flex: 1,
            child: _DrawerContent(),
          ),
          Expanded(
            flex: 3,
            child: _BodyChat(),
          ),
        ],
      ),
    );
  }
}

class _MobileHome extends StatelessWidget {
  const _MobileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: _DrawerContent(),
      ),
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: const _BodyChat(),
    );
  }
}

class _BodyChat extends StatelessWidget {
  const _BodyChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ScreenSizeUtils.isDesktopScreen(context)
          ? const EdgeInsets.all(32)
          : null,
      color: Colors.grey[100],
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (_, state) {
                  if (state is ChatStateLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is ChatStateError) {
                    return const Center(
                      child: Text("Ocorreu um erro"),
                    );
                  }
                  if (state is ChatStateSelected) {
                    return SelectedChat(
                      id: state.chatId,
                      personName: state.personName,
                      message: state.message,
                    );
                  }
                  return CleanChat();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DrawerContent extends StatelessWidget {
  const _DrawerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatCubit = BlocProvider.of<ChatCubit>(context);
    return Column(
      children: [
        const UserAccountsDrawerHeader(
          margin: EdgeInsets.zero,
          accountName: Text("User Test"),
          accountEmail: Text("test@email.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage(
              "images/avatar3.jpg",
            ),
          ),
        ),
        ListTile(
          tileColor: Colors.grey[100],
          leading: const Icon(Icons.keyboard_arrow_left),
          title: const Text("Back to Home"),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(Routes.mainHomePage);
          },
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatData.length,
            itemBuilder: (context, int index) {
              return ListTile(
                onTap: () {
                  chatCubit.selectChat(
                    chatData[index]['id'],
                    chatData[index]['personName'],
                    chatData[index]['message'],
                  );
                  if (!ScreenSizeUtils.isDesktopScreen(context)) {
                    Navigator.of(context).pop();
                  }
                },
                leading: const CircleAvatar(
                  backgroundImage: AssetImage("images/avatar4.png"),
                  // child: Text(
                  //   chatData[index]['personName']
                  //       .toString()
                  //       .substring(0, 2)
                  //       .toUpperCase(),
                  // ),
                ),
                title: Text(chatData[index]['personName']),
                subtitle: Text(chatData[index]['message']),
              );
            },
          ),
        ),
      ],
    );
  }
}
