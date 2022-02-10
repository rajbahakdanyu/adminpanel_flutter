import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constants/constant.dart';
import '/providers/page_provider.dart';

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
        SizedBox(height: MediaQuery.of(context).size.height * .05),
        Image.asset(
          'assets/logo/logo.png',
          width: MediaQuery.of(context).size.width * .05,
        ),
        Padding(
          padding: const EdgeInsets.all(padding / 2),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * .5,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: ListView(
                children: [
                  ListTile(
                    selected: currentPage == 0 ? true : false,
                    onTap: () => _provider.changePage(0),
                    title: const Text('Item 1'),
                  ),
                  ListTile(
                    selected: currentPage == 1 ? true : false,
                    onTap: () => _provider.changePage(1),
                    title: const Text('Item 2'),
                  ),
                  ExpansionTile(
                    iconColor: Theme.of(context).unselectedWidgetColor,
                    textColor: Theme.of(context).textTheme.subtitle1!.color,
                    title: const Text('Item 3'),
                    children: [
                      ListTile(
                        selected: currentPage == 2 ? true : false,
                        onTap: () => _provider.changePage(2),
                        title: const Text('Sub-item 1'),
                      ),
                      ListTile(
                        selected: currentPage == 3 ? true : false,
                        onTap: () => _provider.changePage(3),
                        title: const Text('Sub-item 2'),
                      ),
                    ],
                  ),
                  ListTile(
                    selected: currentPage == 4 ? true : false,
                    onTap: () => _provider.changePage(4),
                    title: const Text('Item 4'),
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
