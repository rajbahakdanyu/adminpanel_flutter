class ChartData {
  ChartData(
    this.year,
    this.sales,
  );

  final DateTime year;
  final double sales;
}

const int day = 30;

final List<ChartData> data = [
  ChartData(DateTime.now(), 120),
  ChartData(DateTime.now().subtract(const Duration(days: day)), 101),
  ChartData(DateTime.now().subtract(const Duration(days: day * 2)), 87),
  ChartData(DateTime.now().subtract(const Duration(days: day * 3)), 73),
  ChartData(DateTime.now().subtract(const Duration(days: day * 4)), 69),
  ChartData(DateTime.now().subtract(const Duration(days: day * 5)), 49),
  ChartData(DateTime.now().subtract(const Duration(days: day * 6)), 32),
];
