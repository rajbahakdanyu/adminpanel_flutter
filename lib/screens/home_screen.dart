import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '/constants/constant.dart';
import '/models/chart_data.dart';
import '/utils/responsive.dart';

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
            height: MediaQuery.of(context).size.height * .5,
            padding: const EdgeInsets.all(padding),
            child: Row(
              children: [
                Expanded(
                  child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    primaryYAxis: NumericAxis(),
                    title: ChartTitle(
                      text: 'Sales Report',
                      textStyle:
                          Theme.of(context).textTheme.headline6!.copyWith(
                                color: Colors.white,
                                fontSize:
                                    MediaQuery.of(context).textScaleFactor * 16,
                              ),
                    ),
                    series: <ChartSeries>[
                      SplineAreaSeries<ChartData, DateTime>(
                        dataSource: data,
                        xValueMapper: (ChartData sales, _) => sales.year,
                        yValueMapper: (ChartData sales, _) => sales.sales,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: padding / 2,
                        ),
                        child: LinearProgressIndicator(
                          value: .9,
                          minHeight: 10,
                        ),
                      ),
                      LinearProgressIndicator(value: .7),
                      LinearProgressIndicator(value: .5),
                      LinearProgressIndicator(value: .4),
                    ],
                  ),
                ),
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
