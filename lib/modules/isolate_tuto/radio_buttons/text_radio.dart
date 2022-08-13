import 'package:flutter/material.dart';

class TextRadio extends StatelessWidget {
  TextRadio(
      {Key? key,
      required this.label,
      this.value = 0,
      this.groupValue = 0,
      this.onChanged})
      : super(key: key) {
    _radioNotifier.value = groupValue;
  }
  final Widget label;
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
        child: Container(
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ValueListenableBuilder<int>(
                valueListenable: _radioNotifier,
                builder: (context, val, _) {
                  return Radio<int>(
                    value: value,
                    groupValue: val,
                    toggleable: true,
                    onChanged: (val) {
                      onChanged?.call(value);
                      _radioNotifier.value = value;
                    },
                  );
                },
              ),
              label,
            ],
          ),
        ),
      ),
    );
  }
}
