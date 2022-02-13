import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/constants/constant.dart';
import '/providers/page_provider.dart';
import '/providers/menu_provider.dart';
import '/utils/responsive.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _menu = Provider.of<MenuProvider>(context);
    final _page = Provider.of<PageProvider>(context);

    return Container(
      color: Colors.grey.shade800,
      height: Platform.isAndroid || Platform.isIOS
          ? null
          : appWindow.titleBarHeight,
      margin: Responsive.isDesktop(context)
          ? EdgeInsets.only(left: MediaQuery.of(context).size.width * .2)
          : null,
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              padding: const EdgeInsets.all(padding / 4),
              onPressed: () => _menu.controlMenu(),
              icon: const Icon(Icons.menu),
            ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.only(
                top: padding / 4,
                left: padding / 4,
              ),
              child: Text(
                _page.pageName,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
        ],
      ),
    );
  }
}
