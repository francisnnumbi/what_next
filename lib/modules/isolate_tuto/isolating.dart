import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:what_next/modules/isolate_tuto/behind_work/work_load.dart';
import 'package:what_next/modules/isolate_tuto/radio_buttons/text_radio.dart';
import 'package:what_next/modules/isolate_tuto/radio_buttons/text_radio_group.dart';

class Isolating extends StatefulWidget {
  const Isolating({Key? key}) : super(key: key);

  @override
  State<Isolating> createState() => _IsolatingState();
}

class _IsolatingState extends State<Isolating> {
  int nthPrime = 0;
  int nth = 0;
  final math.Random _random = math.Random();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  int _bottomBarIndex = 0;

  void _getPrime() async {
    nth = _random.nextInt(100000);
    int ans = await compute(getnthPrime, nth);
    setState(() {
      nthPrime = ans;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Isolating"),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getPrime();
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextRadioGroup(
              title: const Text("Pick a fruit :"),
              direction: Axis.vertical,
              onChanged: (value) {
                log("_changeSelect: $value");
              },
              radios: const [
                "Orange",
                "Apple",
                "Banana",
                "Grape",
                "Pineapple",
                "Strawberry",
                "Watermelon",
              ],
            ),
            Text("${nth}th Prime Number",
                style: Theme.of(context).textTheme.headline5),
            Text(
              nthPrime.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      drawer: const Drawer(),
      endDrawer: const Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomBarIndex,
        onTap: (int index) {
          setState(() {
            _bottomBarIndex = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
    );
  }
}
