// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../screens/main_screen.dart';

List<FlSpot> lineChartData = [
  FlSpot(0, 2),
  FlSpot(1, 4),
  FlSpot(2, 8),
  FlSpot(3, 5),
  FlSpot(4, 10),
  FlSpot(5, 6),
  FlSpot(6, 8),
];
List<BarChartGroupData> barChartData = [
  BarChartGroupData(
    x: 1,
    barRods: [
      BarChartRodData(
        y: 4,
        colors: [Colors.blue],
      ),
    ],
  ),
  BarChartGroupData(
    x: 2,
    barRods: [
      BarChartRodData(
        y: 5,
        colors: [Colors.blue],
      ),
    ],
  ),
  BarChartGroupData(
    x: 3,
    barRods: [
      BarChartRodData(
        y: 3,
        colors: [Colors.blue],
      ),
    ],
  ),
  BarChartGroupData(
    x: 4,
    barRods: [
      BarChartRodData(
        y: 2,
        colors: [Colors.blue],
      ),
    ],
  ),
  BarChartGroupData(
    x: 5,
    barRods: [
      BarChartRodData(
        y: 4,
        colors: [Colors.blue],
      ),
    ],
  ),
];

class PieChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<PieChartSectionData> pieChartData = [
      PieChartSectionData(
        color: Colors.blue,
        value: 25,
        title: 'Photographers',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      PieChartSectionData(
        color: Colors.red,
        value: 35,
        title: 'Customers',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      PieChartSectionData(
        color: Colors.green,
        value: 40,
        title: 'Renting',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
      PieChartSectionData(
        color: Color.fromARGB(255, 175, 76, 158),
        value: 40,
        title: 'Vendors',
        radius: 50,
        titleStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('REPORTS'),
      ),
      body: Stack(children: [
        Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Users Of the App In Various Categories',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 120,
              width: 200,
              child: PieChart(
                PieChartData(
                  sections: pieChartData,
                  borderData: FlBorderData(
                    show: false,
                  ),
                  centerSpaceRadius: 0,
                  sectionsSpace: 0,
                  pieTouchData: PieTouchData(
                    enabled: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Users Of the App In a Week by date',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 200,
              child: LineChart(
                LineChartData(
                  lineTouchData: LineTouchData(
                    enabled: true,
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: lineChartData,
                      isCurved: true,
                      colors: [Colors.blue],
                      barWidth: 2,
                      dotData: FlDotData(
                        show: true,
                      ),
                    ),
                  ],
                  minY: 0,
                  maxX: 6,
                  maxY: 8,
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'jul 1';
                          case 1:
                            return '2';
                          case 2:
                            return '3';
                          case 3:
                            return '4';
                          case 4:
                            return '5';
                          case 5:
                            return '6';
                          case 6:
                            return '7';
                          default:
                            return '';
                        }
                      },
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    horizontalInterval: 2,
                    verticalInterval: 2,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Center(
              child: Text(
                'Ratings and Reviews Report',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: barChartData,
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: const Color.fromARGB(255, 112, 110, 110),
                      width: 1,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) {
                        return value.toInt().toString();
                      },
                      margin: 8,
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTitles: (value) {
                        return value.toInt().toString();
                      },
                      margin: 8,
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    horizontalInterval: 1,
                    verticalInterval: 1,
                    drawHorizontalLine: true,
                    drawVerticalLine: true,
                  ),
                  barTouchData: BarTouchData(
                    enabled: true,
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueGrey.withOpacity(0.9),
                      getTooltipItem: (BarChartGroupData group, int groupIndex,
                          BarChartRodData rod, int rodIndex) {
                        return BarTooltipItem(
                          '${group.x.toInt()} star\n${rod.y.toInt()} reviews',
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 350, top: 780),
          child: FloatingActionButton(
            elevation: 0.0, // Removes the border or elevation
            highlightElevation: 0.0,

            backgroundColor: Colors.green,

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            },
            child: Icon(Icons.home,
                size: 40, color: Color.fromARGB(255, 255, 255, 255)),
          ),
        ),
      ]),
    );
  }
}
