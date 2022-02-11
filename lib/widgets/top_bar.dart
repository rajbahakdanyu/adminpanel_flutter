import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/menu_provider.dart';
import '/utils/responsive.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _menu = Provider.of<MenuProvider>(context);

    return Row(
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            onPressed: () => _menu.controlMenu(),
            icon: const Icon(Icons.menu),
          ),
        if (Responsive.isDesktop(context))
          SizedBox(width: MediaQuery.of(context).size.width * .21),
        if (!Responsive.isMobile(context))
          Text(
            'Admin Panel',
            style: Theme.of(context).textTheme.headline6,
          ),
      ],
    );
  }
}
