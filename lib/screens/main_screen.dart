import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/menu_provider.dart';
import '/utils/responsive.dart';
import '/widgets/drawer.dart';
import '/widgets/window_title_bar.dart';
import '/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuProvider>().scaffoldKey,
      drawer: const SideDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (Responsive.isDesktop(context))
                  const Expanded(
                    child: SideDrawer(),
                  ),
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.grey.shade400,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        const HomeScreen(),
                      ],
                    ),
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
