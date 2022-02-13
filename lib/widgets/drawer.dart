import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constants/constant.dart';
import '/providers/page_provider.dart';
import '/utils/responsive.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          DrawerTitle(),
          DrawerBottomButtons(),
        ],
      ),
    );
  }
}

class DrawerTitle extends StatelessWidget {
  const DrawerTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<PageProvider>(context);
    final int currentPage = _provider.page;

    return Column(
      children: [
        DrawerHeader(
          child: Image.asset(
            'assets/logo/logo.png',
            width: Responsive.isMobile(context)
                ? MediaQuery.of(context).size.width * .15
                : MediaQuery.of(context).size.width * .05,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(padding / 2),
          child: SizedBox(
            height: Responsive.isDesktop(context) &&
                    MediaQuery.of(context).size.height > 700
                ? MediaQuery.of(context).size.height * .6
                : MediaQuery.of(context).size.height * .35,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ListTile(
                    selected: currentPage == 0 ? true : false,
                    onTap: () => _provider.changePage(0, 'Dashboard'),
                    title: const Text('Dashboard'),
                  ),
                  ListTile(
                    selected: currentPage == 1 ? true : false,
                    onTap: () => _provider.changePage(1, 'Users'),
                    title: const Text('Users'),
                  ),
                  ExpansionTile(
                    iconColor: Theme.of(context).unselectedWidgetColor,
                    textColor: Theme.of(context).textTheme.subtitle1!.color,
                    title: const Text('Inventory'),
                    children: [
                      ListTile(
                        selected: currentPage == 2 ? true : false,
                        onTap: () => _provider.changePage(2, 'Items'),
                        title: const Text('Items'),
                      ),
                      ListTile(
                        selected: currentPage == 3 ? true : false,
                        onTap: () => _provider.changePage(3, 'Category'),
                        title: const Text('Category'),
                      ),
                    ],
                  ),
                  ListTile(
                    selected: currentPage == 4 ? true : false,
                    onTap: () => _provider.changePage(4, 'Sales'),
                    title: const Text('Sales'),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class DrawerBottomButtons extends StatelessWidget {
  const DrawerBottomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          title: Center(child: Text('Settings')),
        ),
        ListTile(
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          title: Center(child: Text('Log Out')),
        ),
      ],
    );
  }
}
