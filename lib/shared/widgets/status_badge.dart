import 'package:flutter/material.dart';

class StatusBadge
    extends StatelessWidget {

  final String text;

  const StatusBadge({
    super.key,
    required this.text,
  });

  @override
  Widget build(
      BuildContext context) {

    Color color =
        Colors.orange;

    if (text == "Completed") {
      color = Colors.green;
    }

    if (text == "Not Started") {
      color = Colors.grey;
    }

    return Container(
      padding:
      const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),

      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius:
        BorderRadius.circular(20),
      ),

      child: Text(text),
    );
  }
}