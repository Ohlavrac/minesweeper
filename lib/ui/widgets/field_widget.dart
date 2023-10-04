import 'package:flutter/material.dart';

class FieldWidget extends StatelessWidget {
  final Function()? onDoubleTap;
  final Function()? onTap;
  final Widget flag;
  const FieldWidget({super.key, this.onDoubleTap, this.onTap, required this.flag});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onTap: onTap,
      child: Container(
        height: 10,
        width: 10,
        decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(color: Colors.black, width: 1)),
        //color: Colors.blue,
        child: flag,
      ),
    );
  }
}
