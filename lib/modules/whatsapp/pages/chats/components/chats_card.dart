import 'package:flutter/material.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class ChatsCard extends StatelessWidget {
  const ChatsCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(data["thumb"]),
              radius: 25,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Text(
                      data["user"],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Flexible(
                    child: Text(
                      data["message"],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
             const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  data["date"],
                  style: const TextStyle(fontSize: 12, color: Colors.green),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    if (data["mute"])
                      const Icon(
                        Elusive.volume_off,
                        color: Colors.grey,
                        size: 16,
                      ),
                    if (data["mute"])
                      const SizedBox(
                        width: 8,
                      ),
                    if (data["pin"])
                      const Icon(
                        FontAwesome.pin,
                        color: Colors.grey,
                        size: 16,
                      ),
                    if (data["pin"])
                      const SizedBox(
                        width: 8,
                      ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4),
                        child: Text(
                          data["count"].toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
