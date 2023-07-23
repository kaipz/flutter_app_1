import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Energy Consumption App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: EnergyConsumptionScreen(),
    );
  }
}

class EnergyConsumptionScreen extends StatefulWidget {
  @override
  _EnergyConsumptionScreenState createState() => _EnergyConsumptionScreenState();
}

class _EnergyConsumptionScreenState extends State<EnergyConsumptionScreen> {
  String selectedId = 'IT001E00538316';
  List<String> dropdownIds = ['IT001E00538316', 'IT001E00538315', 'IT001E00538312'];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
  centerTitle: true, // Center the title
  title: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      DropdownButton(
        style: TextStyle(fontSize: 16, 
        color: Colors.white,
        ),
        dropdownColor: Colors.green,
        value: selectedId,
        onChanged: (String? id) {
          setState(() {
            selectedId = id!;
          });
        },
        items: dropdownIds
            .map((id) => DropdownMenuItem(
                  value: id,
                  child: Text(id),
                ))
            .toList(),

      ),
      Text(
        'Consulta e altera il locale', // Add your desired subtitle text
        style: TextStyle(fontSize: 10, color: Colors.white),
      ),
    ],
  ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BottomNavItem(label: 'Inizio', icon: Icons.home, ),
              BottomNavItem(icon: Icons.receipt, label: 'Bollette'),
              BottomNavItem(icon: Icons.book, label: 'Letture'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Energy Consumption Table',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            DataTable(
              columns: [
                DataColumn(label: Text('Month')),
                DataColumn(label: Text('kWh')),
                DataColumn(label: Text('Cost')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Jan')),
                  DataCell(Text('100')),
                  DataCell(Text('\$50')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Feb')),
                  DataCell(Text('150')),
                  DataCell(Text('\$75')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Mar')),
                  DataCell(Text('120')),
                  DataCell(Text('\$60')),
                ]),
                // DataRow(cells: [
                //   DataCell(Text('Apr')),
                //   DataCell(Text('90')),
                //   DataCell(Text('\$45')),
                // ]),
                // DataRow(cells: [
                //   DataCell(Text('May')),
                //   DataCell(Text('130')),
                //   DataCell(Text('\$65')),
                // ]),
                // DataRow(cells: [
                //   DataCell(Text('Jun')),
                //   DataCell(Text('180')),
                //   DataCell(Text('\$90')),
                // ]),
                // DataRow(cells: [
                //   DataCell(Text('Jul')),
                //   DataCell(Text('140')),
                //   DataCell(Text('\$70')),
                // ]),
                // DataRow(cells: [
                //   DataCell(Text('Aug')),
                //   DataCell(Text('110')),
                //   DataCell(Text('\$55')),
                // ]),
              ],
            ),
            SizedBox(height: 12),
            Text(
              'Last 8 Months Energy Consumption',
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Expanded(
       child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              maxY: 200,
              titlesData: FlTitlesData(
                // ... Title settings
              ),
              barGroups: [
                _buildBarGroupData([30, 40, 30], Colors.green),
                _buildBarGroupData([70, 50, 30], Colors.green),
                _buildBarGroupData([40, 60, 20], Colors.green),
                _buildBarGroupData([20, 40, 122], Colors.green),
                _buildBarGroupData([50, 50, 30], Colors.green),
                _buildBarGroupData([60, 80, 40], Colors.green),
                _buildBarGroupData([40, 80, 20], Colors.green),
                _buildBarGroupData([60, 40, 10], Colors.green),
              ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

BarChartGroupData _buildBarGroupData(List<double> values, Color color) {
    double totalValue = values.reduce((a, b) => a + b);
    return BarChartGroupData(
      x: 0,
      barsSpace: 4,
      barRods: [
        BarChartRodData(
          y: values[0],
          width: 16,
          borderRadius: BorderRadius.circular(8),
          colors: [color.withOpacity(0.3)],
        ),
        BarChartRodData(
          y: values[1],
          width: 16,
          borderRadius: BorderRadius.circular(8),
          colors: [color.withOpacity(0.6)],
        ),
        BarChartRodData(
          y: values[2],
          width: 16,
          borderRadius: BorderRadius.circular(8),
          colors: [color.withOpacity(1.0)],
        ),
      ],
    );
  }
}

class BottomNavItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const BottomNavItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        Text(label),
      ],
    );
  }
}
