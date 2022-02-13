import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constants/constant.dart';
import '/providers/page_provider.dart';
import '/widgets/custom_divider.dart';
import '/utils/responsive.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = Provider.of<PageProvider>(context);
    final int currentPage = _provider.page;

    return Drawer(
      elevation: 0,
      backgroundColor: Colors.grey.shade800,
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset(
              'assets/logo/logo.png',
              width: Responsive.isMobile(context)
                  ? MediaQuery.of(context).size.width * .15
                  : MediaQuery.of(context).size.width * .08,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(padding / 2),
          ),
          const CustomDivider(),
          ListTile(
            leading: CircleAvatar(
              child: const Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              backgroundColor: Theme.of(context).canvasColor,
            ),
            onTap: () => _provider.changePage(6, 'Profile'),
            title: const Text('John Doe'),
          ),
          const CustomDivider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(padding / 2),
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  scrollbars: false,
                ),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListTile(
                      selected: currentPage == 0 ? true : false,
                      selectedColor: Colors.white,
                      selectedTileColor: Theme.of(context).canvasColor,
                      onTap: () => _provider.changePage(0, 'Dashboard'),
                      title: const Text('Dashboard'),
                    ),
                    ListTile(
                      selected: currentPage == 1 ? true : false,
                      selectedColor: Colors.white,
                      selectedTileColor: Theme.of(context).canvasColor,
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
                          selectedColor: Colors.white,
                          selectedTileColor: Theme.of(context).canvasColor,
                          onTap: () => _provider.changePage(2, 'Items'),
                          title: const Text('Items'),
                        ),
                        ListTile(
                          selected: currentPage == 3 ? true : false,
                          selectedColor: Colors.white,
                          selectedTileColor: Theme.of(context).canvasColor,
                          onTap: () => _provider.changePage(3, 'Category'),
                          title: const Text('Category'),
                        ),
                      ],
                    ),
                    ListTile(
                      selected: currentPage == 4 ? true : false,
                      selectedColor: Colors.white,
                      selectedTileColor: Theme.of(context).canvasColor,
                      onTap: () => _provider.changePage(4, 'Sales'),
                      title: const Text('Sales'),
                    ),
                    ListTile(
                      selected: currentPage == 5 ? true : false,
                      selectedColor: Colors.white,
                      selectedTileColor: Theme.of(context).canvasColor,
                      onTap: () => _provider.changePage(5, 'Settings'),
                      title: const Text('Settings'),
                    ),
                    ListTile(
                      onTap: () {},
                      title: const Text('Log Out'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
