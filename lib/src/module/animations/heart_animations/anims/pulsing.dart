import 'package:flutter/material.dart';

class HeartPulsing extends StatefulWidget {
  const HeartPulsing({Key? key}) : super(key: key);

  @override
  State<HeartPulsing> createState() => _HeartPulsingState();
}

class _HeartPulsingState extends State<HeartPulsing>
    with TickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? controller;
  AnimationController? sizeController;
  Animation? insideHeartColorAnimation;
  Animation<double>? sizeRatioAnimation;

  int totalAnimationMiliDuration = 150;

  bool clicou = false;

  double ratio = 0.85;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: totalAnimationMiliDuration),
      vsync: this,
    );
    controller!.addListener(() {
      setState(() {});
    });
    controller!.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        sizeController!.forward();
      }
    });

    sizeController = AnimationController(
      duration: Duration(milliseconds: totalAnimationMiliDuration),
      vsync: this,
    );
    sizeController!.addListener(() {
      setState(() {});
    });
    sizeController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        sizeController!.reverse();
      }
      if (status == AnimationStatus.reverse) {}
    });

    insideHeartColorAnimation =
        ColorTween(begin: Colors.red[50], end: Colors.red).animate(controller!);
    animation = Tween<double>(begin: 0, end: 300).animate(controller!)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {}
          if (status == AnimationStatus.forward) {}
        },
      );

    sizeRatioAnimation = Tween<double>(begin: ratio, end: 1).animate(
      CurvedAnimation(
        parent: sizeController!,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Animação coração pulsando",
        ),
      ),
      body: Center(
        child: InkWell(
          hoverColor: Colors.transparent,
          enableFeedback: false,
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            setState(() {
              clicou = !clicou;
              if (clicou) {
                controller!.forward();
              } else {
                controller!.reset();
              }
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                clicou ? Icons.favorite : Icons.favorite_border,
                color: clicou ? Colors.red : Colors.grey,
                size: 45 * sizeRatioAnimation!.value,
              ),
              if (clicou)
                Icon(
                  Icons.favorite,
                  color: insideHeartColorAnimation!.value,
                  size: 45 * sizeRatioAnimation!.value,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
