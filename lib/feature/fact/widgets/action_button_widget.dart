import 'package:cat_trivia/constants/constants.dart';
import 'package:flutter/material.dart';

class ActionButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const ActionButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(smallPadding),
        child: Text(
          text,
          style: const TextStyle(fontSize: bigFontSize),
        ),
      ),
    );
  }
}
