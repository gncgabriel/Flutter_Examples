import 'package:flutter/material.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Examples"),
      ),
      body: const _Body(),
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
          const Text(
            "Alguns exemplos de apps",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount:
                    (MediaQuery.of(context).size.width / 230).floor(),
                children: _mountCardList(),
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

List<Widget> _mountCardList() {
  final list = <Widget>[];
  for (int i = 1; i <= 25; i++) {
    list.add(
      _CardButton(
        iconData: Icons.category_outlined,
        text: "Item $i",
      ),
    );
  }
  return list;
}

class _CardButton extends StatelessWidget {
  const _CardButton({Key? key, required this.iconData, required this.text})
      : super(key: key);
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
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
