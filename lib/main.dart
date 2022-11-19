import 'package:flutter/material.dart';
import 'package:spannable_grid/spannable_grid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Homie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Fitness Homie'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;
  int itemount = 0;

  final screens = [
    Center(child: Text('Targets')),
    SpannableGrid(
      cells: [
        SpannableGridCellData(
          id: 1,
          column: 1,
          row: 1,
          columnSpan: 2,
          child: Container(
              child: Center(child: Text("Text 1")),
              color: Color.fromRGBO(255, 255, 0, 1)),
        ),
        SpannableGridCellData(
            id: 2,
            column: 1,
            row: 2,
            columnSpan: 2,
            child: Container(
                child: Center(child: Text("Text 1")),
                color: Color.fromRGBO(255, 255, 0, 1))),
        SpannableGridCellData(
          id: 3,
          column: 1,
          row: 3,
          child: Container(
              child: Center(child: Text("Text 1")),
              color: Color.fromRGBO(255, 255, 0, 1)),
        ),
        SpannableGridCellData(
          id: 4,
          column: 1,
          row: 4,
          child: Container(
              child: Center(child: Text("Text 1")),
              color: Color.fromRGBO(255, 255, 0, 1)),
        ),
        SpannableGridCellData(
          id: 5,
          column: 2,
          row: 3,
          rowSpan: 2,
          child: Container(
              child: Center(child: Text("Text 1")),
              color: Color.fromRGBO(255, 255, 0, 1)),
        ),
      ],
      columns: 2,
      rows: 4,
      style: SpannableGridStyle(
        spacing: 10,
      ),
    ),
    Center(child: Text('Profile')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              label: "Targets", icon: Icon(Icons.track_changes)),
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person))
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
