import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

// class BarChartSample4 extends StatefulWidget {
//   BarChartSample4({super.key});

//   final Color dark = Colors.green;
//   final Color normal = Color.fromARGB(220, 25, 45, 2);
//   final Color light = Colors.lightGreen;

//   @override
//   State<StatefulWidget> createState() => BarChartSample4State();
// }

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
       child:  LayoutBuilder(builder: (context, constraints) {
            final barsSpace = 4.0 * constraints.maxWidth / 200;
            final barsWidth = 8.0 * constraints.maxWidth / 200;
            return BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceEvenly,
              maxY: 40,
              titlesData: FlTitlesData(
                // ... Title settings
              ),
                             barGroups: getData(barsWidth, barsSpace),

                ),
              );
            
  }
  ),
   
        ),
      
          ]
  ),
    ));
  }

List<BarChartGroupData> getData(double barsWidth, double barsSpace) {
    return [
      BarChartGroupData(
        x: 0,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            y: 29,
            rodStackItems: [
              BarChartRodStackItem(0, 9, Color.fromARGB(220, 25, 45, 2)),
              BarChartRodStackItem(9, 15, Colors.green),
              BarChartRodStackItem(15, 29, Colors.lightGreen),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          
        ],
      ),
      BarChartGroupData(
        x: 1,
        barsSpace: barsSpace,
        barRods: [
          BarChartRodData(
            y: 31,
            rodStackItems: [
              BarChartRodStackItem(0, 11, Color.fromARGB(220, 25, 45, 2)),
              BarChartRodStackItem(11, 18, Colors.green),
              BarChartRodStackItem(18, 31, Colors.lightGreen),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
          
        ],
      ),
      BarChartGroupData(
        x: 2,
        barsSpace: barsSpace,
        barRods: [
         
          BarChartRodData(
            y: 24,
            rodStackItems: [
              BarChartRodStackItem(0, 4, Color.fromARGB(220, 25, 45, 2)),
              BarChartRodStackItem(4, 15, Colors.green),
              BarChartRodStackItem(15, 24, Colors.lightGreen),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
      BarChartGroupData(
        x: 3,
        barsSpace: barsSpace,
        barRods: [
          
          BarChartRodData(
            y: 29,
            rodStackItems: [
              BarChartRodStackItem(0, 6, Color.fromARGB(220, 25, 45, 2)),
              BarChartRodStackItem(6, 23, Colors.green),
              BarChartRodStackItem(23, 29, Colors.lightGreen),
            ],
            borderRadius: BorderRadius.zero,
            width: barsWidth,
          ),
        ],
      ),
    ];
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
