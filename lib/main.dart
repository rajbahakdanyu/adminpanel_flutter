import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/page_provider.dart';
import 'providers/menu_provider.dart';
import 'screens/main_screen.dart';
import 'theme/theme_data.dart';

void main() {
  runApp(const MyApp());

  doWhenWindowReady(() {
    const initialSize = Size(600, 450);
    appWindow.minSize = initialSize;
    appWindow.size = initialSize;
    appWindow.alignment = Alignment.center;
    appWindow.maximize();
    appWindow.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin panel',
      darkTheme: darkTheme(),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => PageProvider(),
          ),
        ],
        child: const MainScreen(),
      ),
    );
  }
}
