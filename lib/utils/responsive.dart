import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    Key? key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 800 &&
      MediaQuery.of(context).size.width >= 600;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800;

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    if (_size.width >= 900) {
      return desktop;
    } else if (_size.width >= 900 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}
