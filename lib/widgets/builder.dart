import 'package:adminpanel/screens/login_screen.dart';
import 'package:flutter/material.dart';

class MainBuilder extends StatelessWidget {
  const MainBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return const LoginScreen();
      },
    );
  }
}
