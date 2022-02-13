class ChartData {
  ChartData(
    this.year,
    this.sales,
  );

  final DateTime year;
  final double sales;
}

final List<ChartData> data = [
  ChartData(DateTime.now(), 35),
  ChartData(DateTime.now().subtract(const Duration(days: 1)), 28),
  ChartData(DateTime.now().subtract(const Duration(days: 2)), 34),
  ChartData(DateTime.now().subtract(const Duration(days: 3)), 32),
  ChartData(DateTime.now().subtract(const Duration(days: 4)), 40),
];
