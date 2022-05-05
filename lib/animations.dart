import 'package:flutter/material.dart';

class Animation1 extends StatefulWidget {
  const Animation1({Key? key}) : super(key: key);

  @override
  State<Animation1> createState() => _Animation1State();
}

class _Animation1State extends State<Animation1> {
  double width = 300.0;

  @override
  void initState() {
    // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
    //   while (true) {
    //     changeWidth();
    //   }
    // });
  }

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
