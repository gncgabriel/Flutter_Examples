import 'package:flutter/material.dart';
import 'package:flutter_examples/src/shared/constants/routes.dart';

class HeartAnimations extends StatelessWidget {
  const HeartAnimations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text("Exemplos de animações de coração"),
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Icon(
                Icons.favorite,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              child: Text(
                "Selecione uma opção:",
                textAlign: TextAlign.center,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(Routes.heartPulsing);
                      },
                      child: const Text(
                        "Animação coração pulsando",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
