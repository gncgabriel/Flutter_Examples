import 'package:flutter/material.dart';
import 'package:flutter_examples/src/shared/constants/routes.dart';
import 'package:flutter_examples/src/shared/utils/screen_size.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Alguns exemplos de apps",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: getGridViewCounting(context),
                children: [
                  _CardButton(
                    iconData: Icons.question_answer,
                    text: "Chat App",
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.chatExamplePage);
                    },
                  ),
                  _CardButton(
                    iconData: Icons.animation,
                    text: "Heart Animations",
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.heartAnimations);
                    },
                  ),
                  ..._mountCardList(),
                ],
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

int getGridViewCounting(BuildContext context) {
  if (ScreenSizeUtils.isPhoneScreen(context)) {
    return (MediaQuery.of(context).size.width / 150).floor();
  } else if (ScreenSizeUtils.isTabletScreen(context)) {
    return (MediaQuery.of(context).size.width / 180).floor();
  } else {
    return (MediaQuery.of(context).size.width / 230).floor();
  }
}

List<Widget> _mountCardList() {
  final list = <Widget>[];
  for (int i = 1; i <= 25; i++) {
    list.add(
      _CardButton(
        iconData: Icons.category_outlined,
        text: "Item $i",
        onPressed: () => {},
      ),
    );
  }
  return list;
}

class _CardButton extends StatelessWidget {
  const _CardButton({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onPressed,
  }) : super(key: key);
  final IconData iconData;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.blueGrey[400],
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 116,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              iconData,
              color: Colors.blue[700],
              size: 45,
            ),
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.blue[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
