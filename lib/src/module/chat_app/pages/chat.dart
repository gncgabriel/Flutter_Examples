import 'package:flutter/material.dart';
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
    return (ScreenSizeUtils.isDesktopScreen(context))
        ? const _Home()
        : const _MobileHome();
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
      padding: const EdgeInsets.all(24),
      color: Colors.grey[100],
      child: Column(
        children: [
          Container(
            height: 64,
          ),
          Expanded(
            child: Container(
              color: Colors.white,
            ),
          ),
          Container(
            height: 64,
          ),
        ],
      ),
    );
  }
}

class _DrawerContent extends StatelessWidget {
  const _DrawerContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const UserAccountsDrawerHeader(
          margin: EdgeInsets.zero,
          accountName: Text("User Test"),
          accountEmail: Text("test@email.com"),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
          ),
        ),
        ListTile(
          tileColor: Colors.grey[100],
          leading: const Icon(Icons.keyboard_arrow_left),
          title: const Text("Voltar"),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(Routes.mainHomePage);
          },
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, int qtd) {
              return ListTile(
                leading: const CircleAvatar(
                  child: Text("C"),
                ),
                title: Text("Chat $qtd"),
              );
            },
          ),
        ),
      ],
    );
  }
}
