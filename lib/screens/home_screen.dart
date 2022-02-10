import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/menu_provider.dart';
import '/utils/responsive.dart';
import '/widgets/window_title_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuProvider>().scaffoldKey,
      drawer: const Drawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  const Expanded(
                    child: Drawer(),
                  ),
                Expanded(
                  flex: 5,
                  child: Container(
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const WindowTitlebar(),
          ],
        ),
      ),
    );
  }
}
