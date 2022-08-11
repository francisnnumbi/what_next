import 'package:flutter/material.dart';
import 'text_radio.dart';

class TextRadioGroup extends StatefulWidget {
  const TextRadioGroup(
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

  @override
  State<TextRadioGroup> createState() => _TextRadioGroupState();
}

class _TextRadioGroupState extends State<TextRadioGroup> {
  int _selectedRadio = 0;
  late List<TextRadio> _radios;
  _initializeRadios() {
    _radios = [];
    for (int i = 0; i < widget.radios.length; i++) {
      _radios.add(TextRadio(
        label: widget.radios[i],
        value: i,
        groupValue: _selectedRadio,
        onChanged: _changeSelect,
      ));
    }
  }

  _changeSelect(int value) {
    widget.onChanged?.call(value);

    setState(() {
      _selectedRadio = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    _initializeRadios();
    return Column(
      children: [
        widget.title ?? const SizedBox(),
        Wrap(
          direction: widget.direction,
          children: _radios,
        ),
      ],
    );
  }
}
