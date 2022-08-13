import 'dart:developer';

import 'package:flutter/material.dart';
import 'text_radio.dart';

class TextRadioGroup extends StatelessWidget {
  TextRadioGroup(
      {Key? key,
      this.title,
      this.radios = const [],
      this.direction = Axis.horizontal,
      this.onChanged})
      : super(key: key);
  final Widget? title;
  final List<Widget> radios;
  final Axis direction;
  final ValueChanged<int>? onChanged;
  final ValueNotifier<int> radioGroupNotifier = ValueNotifier(0);

  List<TextRadio> _populateRadios() {
    final tRadios = <TextRadio>[];
    for (int i = 0; i < radios.length; i++) {
      tRadios.add(TextRadio(
        label: radios[i],
        value: i,
        groupValue: radioGroupNotifier.value,
        onChanged: _changeSelect,
      ));
    }
    return tRadios;
  }

  _changeSelect(int value) {
    onChanged?.call(value);
    radioGroupNotifier.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        title ?? const SizedBox(),
        ValueListenableBuilder(
            valueListenable: radioGroupNotifier,
            builder: (context, val, _) {
              return Wrap(
                direction: direction,
                children: _populateRadios(),
              );
            }),
      ],
    );
  }
}
