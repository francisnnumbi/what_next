
import 'package:flutter/material.dart';

class Flexing extends StatelessWidget {
  const Flexing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  const Text("Flexing"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Text("Flexing"),
          ],
        ),
      ),
    );
  }
}