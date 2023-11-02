import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final Function()? onDoubleTap;
  final Function()? onTap;
  final Color color;
  final Widget flag;
  const FieldWidget(
      {this.onDoubleTap, this.onTap, required this.flag, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onTap: onTap,
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black, width: 1)),
        //color: Colors.blue,
        child: flag,
      ),
    );
  }
}
