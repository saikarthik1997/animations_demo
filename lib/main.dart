import 'package:demo/animations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        children: const [
          Animation1(),
          Animation2(),
          Animation3(),
          TweenAnimation(),
          XYZTransition(),
          BuilderAnimation(),
          RotatingSquare()
        ],
      ),
    ));
  }
}
