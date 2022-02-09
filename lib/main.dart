import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/menu_provider.dart';
import 'screens/login_screen.dart';
import 'theme/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin panel',
      theme: lightTheme(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuProvider(),
          ),
        ],
        child: const LoginScreen(),
      ),
    );
  }
}
