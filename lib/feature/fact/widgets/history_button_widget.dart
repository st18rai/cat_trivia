import 'package:flutter/material.dart';

class HistoryButtonWidget extends StatelessWidget {
  final GestureTapCallback? onTap;

  const HistoryButtonWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Icon(Icons.access_time_rounded),
    );
  }
}
