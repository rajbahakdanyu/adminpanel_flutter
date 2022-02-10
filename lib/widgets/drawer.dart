import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * .05),
          FaIcon(
            FontAwesomeIcons.userCircle,
            size: MediaQuery.of(context).size.width * .04,
          ),
          Text(
            'Admin Panel',
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: MediaQuery.of(context).size.width * .015,
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .7,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const ListTile(
                    title: Text('Hello'),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
