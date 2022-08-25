import 'package:flutter/material.dart';
import 'package:what_next/modules/whatsapp/dummy_data.dart';

import 'components/chats_card.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        itemCount: chatsData.length,
        itemBuilder: (context, index) {
          return ChatsCard(
            data: chatsData[index],
          );
        },
      ),
    );
  }
}
