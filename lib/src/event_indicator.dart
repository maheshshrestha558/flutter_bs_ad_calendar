import 'package:flutter/material.dart';

class EventIndicator extends StatelessWidget {
  const EventIndicator({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: const EdgeInsets.only(left: 6, bottom: 10),
        width: 4,
        height: 4,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
