import 'package:flutter/material.dart';

import '/constants/constant.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.indent,
    this.thickness,
  }) : super(key: key);

  final double? thickness;
  final double? indent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ?? 1,
      indent: indent ?? indents,
      endIndent: indent ?? indents,
      color: Theme.of(context).canvasColor,
    );
  }
}
