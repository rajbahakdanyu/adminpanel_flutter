import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/providers/menu_provider.dart';
import '/utils/responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuProvider>().scaffoldKey,
      drawer: Container(
        color: Colors.amber,
      ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              Expanded(
                child: Container(
                  color: Colors.amber,
                ),
              ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
