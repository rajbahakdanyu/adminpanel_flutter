import 'package:adminpanel/constants/constant.dart';
import 'package:adminpanel/utils/responsive.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Responsive(
            mobile: InfoRow(
              crossCount: 2,
              aspectRatio: 21 / 9,
            ),
            tablet: InfoRow(
              crossCount: 4,
              aspectRatio: 8 / 1,
            ),
            desktop: InfoRow(
              crossCount: 4,
              aspectRatio: 16 / 9,
            ),
          ),
        ),
      ],
    );
  }
}

class InfoRow extends StatelessWidget {
  const InfoRow({
    Key? key,
    required this.crossCount,
    required this.aspectRatio,
  }) : super(key: key);

  final int crossCount;
  final double aspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 4,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossCount,
        crossAxisSpacing: padding / 2,
        mainAxisSpacing: padding / 2,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) {
        return const InfoCard();
      },
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(padding / 2),
        child: Row(
          children: const [
            Card(
              child: Padding(
                padding: EdgeInsets.all(padding / 2),
                child: Icon(Icons.person),
              ),
            ),
            Text('Item'),
          ],
        ),
      ),
    );
  }
}
