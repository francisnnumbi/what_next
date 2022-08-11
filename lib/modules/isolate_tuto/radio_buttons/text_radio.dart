import 'package:flutter/material.dart';

class TextRadio extends StatefulWidget {
  TextRadio(
      {Key? key,
      required this.label,
      this.value = 0,
      this.groupValue = 0,
      this.onChanged})
      : super(key: key);
  final Widget label;
  late int value;
  late int groupValue;
  final ValueChanged<int>? onChanged;

  @override
  State<TextRadio> createState() => _TextRadioState();
}

class _TextRadioState extends State<TextRadio> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: InkWell(
        onTap: () {
          widget.onChanged?.call(widget.value);
          setState(() {
            widget.groupValue = widget.value;
          });
        },
        child: Container(
          // color: Colors.green,
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Radio<int>(
                value: widget.value,
                groupValue: widget.groupValue,
                toggleable: true,
                onChanged: (val) {
                  // int v = widget.value == 0 ? 1 : 0;
                  widget.onChanged?.call(widget.value);
                  setState(() {
                    widget.groupValue = widget.value;
                  });
                },
              ),
              widget.label,
            ],
          ),
        ),
      ),
    );
  }
}
