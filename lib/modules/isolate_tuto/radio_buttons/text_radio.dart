import 'package:flutter/material.dart';

enum TextRadioTitlePosition {
  left,
  right,
}

class TextRadio extends StatelessWidget {
  TextRadio(
      {Key? key,
      required this.title,
      this.titlePosition = TextRadioTitlePosition.right,
      this.value = 0,
      this.groupValue = 0,
      this.padding = const EdgeInsets.all(2.0),
      this.onChanged})
      : super(key: key) {
    _radioNotifier.value = groupValue;
  }
  final Widget title;
  final TextRadioTitlePosition titlePosition;
  final EdgeInsets padding;
  final int value;
  final int groupValue;
  final ValueChanged<int>? onChanged;
  final ValueNotifier<int> _radioNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
        onTap: () {
          onChanged?.call(value);
          _radioNotifier.value = value;
        },
        child: ValueListenableBuilder<int>(
            valueListenable: _radioNotifier,
            builder: (context, val, _) {
              return Container(
                padding: padding,
                decoration: BoxDecoration(
                  color: val == value
                      ? Theme.of(context).primaryColor.withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (titlePosition == TextRadioTitlePosition.left)
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: title,
                      )),
                    Radio<int>(
                      value: value,
                      groupValue: val,
                      toggleable: true,
                      onChanged: (val) {
                        onChanged?.call(value);
                        _radioNotifier.value = value;
                      },
                    ),
                    if (titlePosition == TextRadioTitlePosition.right)
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 4.0),
                        child: title,
                      )),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
