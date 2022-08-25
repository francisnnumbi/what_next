import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:what_next/modules/whatsapp/pages/chats/chats_screen.dart';
import 'package:what_next/modules/whatsapp/pages/status/status_screen.dart';

class Whatsapp extends StatelessWidget {
  const Whatsapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.teal,
          elevation: 0.5,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          title: const Text("WhatsApp"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
          bottom: const TabBar(tabs: [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              child: Text("CHATS"),
            ),
            Tab(
              child: Text("STATUS"),
            ),
            Tab(
              child: Text("CALLS"),
            ),
          ]),
        ),
        body: const TabBarView(children: [
          Text("First"),
          ChatsScreen(),
          StatusScreen(),
          Text("Fourth"),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.message),
        ),
      ),
    );
  }
}
