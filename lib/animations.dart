import 'dart:math';

import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  const Animation1({Key? key}) : super(key: key);

  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> {
  double width = 300.0;

  changeWidth() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        width = width == 300.0 ? 500.0 : 300.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400.0,
        width: 400.0,
        child: Column(
          children: [
            Expanded(
              child: AnimatedContainer(
                width: width,
                duration: const Duration(seconds: 1),
                child: Image.asset("assets/images/star.png"),
              ),
            ),
            ElevatedButton(onPressed: changeWidth, child: Text("Change"))
          ],
        ));
  }
}

class Animation2 extends StatefulWidget {
  const Animation2({Key? key}) : super(key: key);

  @override
  State<Animation2> createState() => _Animation2State();
}

class _Animation2State extends State<Animation2> {
  double width = 300.0;

  changeWidth() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        width = width == 300.0 ? 500.0 : 300.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400.0,
        width: 400.0,
        child: Column(
          children: [
            Expanded(
              child: AnimatedContainer(
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: const [Colors.purple, Colors.transparent],
                        stops: [width == 300 ? 0.3 : 0.5, 1.0])),
                width: width,
                duration: const Duration(seconds: 1),
                child: Image.asset("assets/images/star.png"),
              ),
            ),
            ElevatedButton(onPressed: changeWidth, child: Text("Change"))
          ],
        ));
  }
}

class Animation3 extends StatefulWidget {
  const Animation3({Key? key}) : super(key: key);

  @override
  State<Animation3> createState() => _Animation3State();
}

class _Animation3State extends State<Animation3> {
  double width = 300.0;

  changeWidth() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        width = width == 300.0 ? 500.0 : 300.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400.0,
        width: 400.0,
        child: Column(
          children: [
            Expanded(
              child: AnimatedContainer(
                curve: SineCurve(count: 2),
                decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: const [Colors.purple, Colors.transparent],
                        stops: [width == 300 ? 0.3 : 0.5, 1.0])),
                width: width,
                duration: const Duration(seconds: 1),
                child: Image.asset("assets/images/star.png"),
              ),
            ),
            ElevatedButton(onPressed: changeWidth, child: const Text("Change"))
          ],
        ));
  }
}

class SineCurve extends Curve {
  final double count;

  const SineCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}


class TweenAnimation extends StatefulWidget {
  const TweenAnimation({Key? key}) : super(key: key);

  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> {
  Color c1 = Colors.white;
  Color c2 = Colors.yellow;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      width: 400.0,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'TweenAnimation',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),

            // Using TweenAnimationBuilder
            TweenAnimationBuilder(
              tween: ColorTween(begin: c1, end: c2),
              duration: const Duration(seconds: 1),
              builder: (_, Color? color, __) {
                return ColorFiltered(
                  // image assets
                  child: Image.asset(
                    'assets/images/bird.png',
                    height: 180,
                  ),
                  colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),

            // button
            RaisedButton(
              onPressed: () {
                setState(() {
                  c1 = c1 == Colors.white ? Colors.yellow : Colors.white;
                  c2 = c2 == Colors.yellow ? Colors.white : Colors.yellow;
                });
              },
              child: Text('Change Color'),
            )
          ],
        ),
      ),
    );
  }
}
