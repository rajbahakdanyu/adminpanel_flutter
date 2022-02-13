import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '/constants/constant.dart';
import '/utils/responsive.dart';

class SalesData {
  SalesData(
    this.year,
    this.sales,
  );

  final DateTime year;
  final double sales;
}

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
  }) : super(key: key);

  final List<SalesData> data = [
    SalesData(DateTime.now(), 35),
    SalesData(DateTime.now().add(const Duration(days: 1)), 28),
    SalesData(DateTime.now().add(const Duration(days: 2)), 34),
    SalesData(DateTime.now().add(const Duration(days: 3)), 32),
    SalesData(DateTime.now().add(const Duration(days: 4)), 40)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.height * .18
              : MediaQuery.of(context).size.height * .5,
          child: const Responsive(
            mobile: InfoRow(
              crossCount: 2,
              aspectRatio: 16 / 9,
            ),
            tablet: InfoRow(
              crossCount: 2,
              aspectRatio: 26 / 9,
            ),
            desktop: InfoRow(
              crossCount: 4,
              aspectRatio: 21 / 9,
            ),
          ),
        ),
        Card(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .4,
            padding: const EdgeInsets.all(padding),
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(),
              series: <ChartSeries>[
                LineSeries<SalesData, DateTime>(
                  dataSource: data,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                )
              ],
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
        return InfoCard(
          index: index,
        );
      },
    );
  }
}

class InfoCard extends StatelessWidget {
  InfoCard({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  final List items = [
    {
      'icon': Icons.settings,
      'color': Colors.blue,
      'title': 'CPU Traffic',
      'subtitle': '10 %',
    },
    {
      'icon': Icons.thumb_up_alt_sharp,
      'color': Colors.red,
      'title': 'Likes',
      'subtitle': '69,420',
    },
    {
      'icon': Icons.shopping_cart,
      'color': Colors.green,
      'title': 'Sales',
      'subtitle': '760',
    },
    {
      'icon': Icons.group_rounded,
      'color': Colors.brown,
      'title': 'New Members',
      'subtitle': '2,000',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade800,
      child: Padding(
        padding: const EdgeInsets.all(padding / 2),
        child: Row(
          children: [
            Card(
              color: items[index]['color'],
              child: Padding(
                padding: const EdgeInsets.all(padding / 2),
                child: Icon(
                  items[index]['icon'],
                  size: Responsive.isDesktop(context)
                      ? MediaQuery.of(context).size.width * .035
                      : MediaQuery.of(context).size.width * .06,
                ),
              ),
            ),
            const SizedBox(width: padding / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  items[index]['title'],
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  items[index]['subtitle'],
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
