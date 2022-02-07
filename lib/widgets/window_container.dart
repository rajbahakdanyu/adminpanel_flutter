import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowContainer extends StatelessWidget {
  const WindowContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WindowBorder(
      color: Colors.transparent,
      width: 0,
      child: child,
    );
  }
}
