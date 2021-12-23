import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_examples/src/module/chat_app/cubits/chat_cubit.dart';

class SelectedChat extends StatelessWidget {
  const SelectedChat({
    Key? key,
    required this.id,
    required this.personName,
    required this.message,
  }) : super(key: key);

  final int id;
  final String personName;
  final String message;

  @override
  Widget build(BuildContext context) {
    final chatCubit = BlocProvider.of<ChatCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    chatCubit.clearState();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text(personName),
                    subtitle: Text(
                      "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                    ),
                    leading: const CircleAvatar(
                      backgroundImage: AssetImage("images/avatar4.png"),
                      // child: Text(
                      //   chatData[index]['personName']
                      //       .toString()
                      //       .substring(0, 2)
                      //       .toUpperCase(),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.2,
            ),
          ],
        ),
        Container(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 16,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    label: Text("Message"),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: Colors.blue[700],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
