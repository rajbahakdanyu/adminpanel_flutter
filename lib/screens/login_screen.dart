import 'package:flutter/material.dart';

import '/widgets/window_buttons.dart';
import '/widgets/window_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return WindowContainer(
      child: Scaffold(
        body: Column(
          children: const <Widget>[
            WindowTitleBar(),
          ],
        ),
      ),
    );
  }
}
