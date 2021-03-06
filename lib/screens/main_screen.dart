import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constants/constant.dart';
import '/providers/menu_provider.dart';
import '/utils/responsive.dart';
import '/widgets/drawer.dart';
import '/widgets/top_bar.dart';
import '/widgets/window_title_bar.dart';
import '/providers/page_provider.dart';
import '/screens/home_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<PageProvider>(context);
    final int currentpage = _provider.page;

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
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      scrollbars: false,
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Container(
                        padding: const EdgeInsets.all(padding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * .05,
                            ),
                            currentScreen(currentpage),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const TopBar(),
            if (!Platform.isAndroid && !Platform.isIOS) const WindowTitlebar(),
          ],
        ),
      ),
    );
  }

  Widget currentScreen(currentpage) {
    switch (currentpage) {
      case 1:
        return const HomeScreen();
      case 2:
        return const HomeScreen();
      case 3:
        return const HomeScreen();
      case 4:
        return const HomeScreen();
      case 5:
        return const HomeScreen();
      case 6:
        return const HomeScreen();
      default:
        return const HomeScreen();
    }
  }
}
