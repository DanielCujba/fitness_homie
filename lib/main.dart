import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:spannable_grid/spannable_grid.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'notifications.dart' as LocalNoticeService;
import 'test.dart' as Tests;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNoticeService.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health Homie',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          )),
      home: const MyHomePage(title: 'Health Homie'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List data = [
  ['Water', 'Drink at least 2L of water a day', 10, false],
  ['Instagram', 'Spend less time on instagram', 10, false],
  ['Sleep', 'Go to sleep to 10pm', 10, false],
  ['Exercises', 'Do 10 push-ups', 10, true],
  ['Walking', 'Walk at least 8000 steps', 10, false],
];

class TaskBox extends StatefulWidget {
  final taskName;
  final description;
  final limit;
  final isDone;

  const TaskBox({
    super.key,
    required this.taskName,
    required this.description,
    required this.limit,
    required this.isDone,
  });

  @override
  State<TaskBox> createState() => _TaskBoxState();
}

class _TaskBoxState extends State<TaskBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: !widget.isDone
              ? Color.fromRGBO(235, 235, 235, 1)
              : Color.fromARGB(255, 149, 205, 85),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0),
                      child: Text(
                        widget.taskName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: !widget.isDone ? Colors.black : Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: 100,
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                            color: !widget.isDone ? Colors.black : Colors.black,
                          ),
                        ))
                  ]))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;
  int counter = 5;
  bool _value = false;
  int _completed_tasks = 1;
  List<Widget> tasks = [];
  final tasks_progress = [];
  int _total_tasks = 5;
  int _water = 0;

  List<Widget> screens = [
    SpannableGrid(
      cells: [],
      rows: 1,
      columns: 1,
    ),
    SpannableGrid(
      cells: [],
      rows: 1,
      columns: 1,
    ),
    Stack()
  ];

  void onPressed() {
    setState(() {
      TextEditingController nameField = new TextEditingController();
      TextEditingController limitField = new TextEditingController();
      TextEditingController descriptionField = new TextEditingController();
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Alert Dialog Box"),
                content: const Text("You have raised a Alert Dialog Box"),
                actions: <Widget>[
                  TextField(
                    controller: nameField,
                    autofocus: true,
                    decoration: new InputDecoration(
                        labelText: 'Add a task', hintText: 'Task Name'),
                  ),
                  TextField(
                    controller: limitField,
                    autofocus: true,
                    decoration: new InputDecoration(hintText: 'Task Limit'),
                  ),
                  TextField(
                    autofocus: true,
                    controller: descriptionField,
                    decoration:
                        new InputDecoration(hintText: 'Task Description'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _total_tasks += 1;
                      });
                      Navigator.of(ctx).pop();

                      data.add([
                        nameField.text,
                        descriptionField.text,
                        limitField.text,
                        false
                      ]);
                    },
                    child: Container(
                      color: Colors.deepPurple,
                      padding: const EdgeInsets.all(14),
                      child: const Text("okay"),
                    ),
                  ),
                ],
              ));
    });
  }

  Stack create_profile_page() {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                height: 10,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                    height: 80.0,
                  ),
                  CircleAvatar(
                    radius: 65.0,
                    foregroundImage: AssetImage("blank-profile.jpg"),
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text('Dumitrana Mihnea',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      )),
                  Text(
                    'Experienced User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                    ),
                  )
                ]),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.grey[200],
                child: Center(
                  child: Card(
                      margin: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 10.0),
                      child: Container(
                          width: 310.0,
                          height: 290.0,
                          child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 60,
                                  ),
                                  Text(
                                    "Information",
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey[300],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Icon(
                                        Icons.fitness_center,
                                        color: Colors.blueAccent[400],
                                        size: 35,
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Body Type",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          Text(
                                            "Burly",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[400],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.accessibility_new,
                                        color: Colors.yellowAccent[400],
                                        size: 35,
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Heigth",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          Text(
                                            "1.86 meters",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[400],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.pinkAccent[400],
                                        size: 35,
                                      ),
                                      SizedBox(
                                        width: 20.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Vitals",
                                            style: TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                          Text(
                                            "Active lifestyle, Healthy BMI",
                                            style: TextStyle(
                                              fontSize: 12.0,
                                              color: Colors.grey[400],
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                ],
                              )))),
                ),
              ),
            )
          ],
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.45,
            left: 20.0,
            right: 20.0,
            child: Card(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      child: Column(
                    children: [
                      Text(
                        'Daily streak',
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "$counter",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  )),
                  Container(
                    child: Column(children: [
                      Text(
                        'Birthday',
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'April 7th',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      )
                    ]),
                  ),
                  Container(
                      child: Column(
                    children: [
                      Text(
                        'Age',
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        '19 yrs',
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      )
                    ],
                  )),
                ],
              ),
            )))
      ],
    );
  }

  SpannableGrid create_targets_page() {
    return SpannableGrid(
      gridSize: SpannableGridSize.parent,
      cells: [
        SpannableGridCellData(
            id: 1,
            column: 1,
            row: 1,
            child: Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(235, 235, 235, 1),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Daily Tasks Completed $_completed_tasks/$_total_tasks",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ))),
        SpannableGridCellData(
          id: 2,
          column: 1,
          row: 2,
          child: Container(
            margin: EdgeInsets.fromLTRB(10, 0, 20, 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
            child: LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: MediaQuery.of(context).size.width * 0.8,
              lineHeight: 20.0,
              animation: true,
              animationDuration: 2500,
              percent: _completed_tasks / _total_tasks,
              backgroundColor: Color.fromRGBO(235, 235, 235, 1),
              progressColor: Colors.deepPurpleAccent,
              barRadius: Radius.circular(16),
            ),
          ),
        ),
        SpannableGridCellData(
            id: 3,
            column: 1,
            row: 3,
            rowSpan: 7,
            child: GridView.builder(
              itemCount: data.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // data[index][2] = !data[index][2];
                    // print(data[index][2]);
                  },
                  child: TaskBox(
                      taskName: data[index][0],
                      description: data[index][1],
                      limit: data[index][2],
                      isDone: data[index][3]),
                );
              },
            )),
        SpannableGridCellData(
            id: 4,
            column: 1,
            row: 10,
            child: Container(
                margin: EdgeInsets.all(10),
                child: FloatingActionButton(
                  onPressed: onPressed,
                  child: Icon(Icons.add),
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                )))
      ],
      rows: 10,
      columns: 1,
    );
  }

  SpannableGrid create_home_page() {
    return SpannableGrid(
      cells: [
        SpannableGridCellData(
            id: 1,
            column: 1,
            row: 1,
            columnSpan: 4,
            rowSpan: 3,
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 5, color: Color.fromARGB(255, 115, 115, 130)),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color.fromRGBO(240, 240, 240, 1)),
                child: SpannableGrid(
                  cells: [
                    SpannableGridCellData(
                      id: 5,
                      column: 1,
                      row: 1,
                      columnSpan: 4,
                      rowSpan: 2,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Hello Dumi,",
                            style: TextStyle(
                              fontSize: 35,
                              fontFamily: "Lato",
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "You're getting close\n to your steps goal!",
                            style: TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontStyle: FontStyle.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                    SpannableGridCellData(
                        id: 7,
                        column: 1,
                        row: 3,
                        columnSpan: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.85,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Steps\ncounter"),
                                  Text("Target\n   8k"),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              child: LinearPercentIndicator(
                                alignment: MainAxisAlignment.center,
                                width: MediaQuery.of(context).size.width * 0.86,
                                animation: true,
                                lineHeight: 20.0,
                                animationDuration: 1000,
                                percent: 0.724,
                                barRadius: const Radius.circular(16),
                                center: Text("72.4%"),
                                progressColor: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ))
                  ],
                  columns: 4,
                  rows: 3,
                  style: SpannableGridStyle(
                    spacing: 0,
                  ),
                ))),
        SpannableGridCellData(
          id: 2,
          column: 1,
          row: 4,
          columnSpan: 2,
          rowSpan: 2,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 5, color: Color.fromARGB(255, 115, 115, 130)),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color.fromRGBO(240, 240, 240, 1)),
              child: Center(
                  child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          "\nScreen Time",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                          child: Flex(
                        direction: Axis.vertical,
                        children: [
                          new CircularPercentIndicator(
                            radius: 35.0,
                            lineWidth: 10.0,
                            percent: 0.33,
                            animateFromLastPercent: true,
                            center: new Text(
                              "8/6\nhrs",
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                              ),
                            ),
                            progressColor: Colors.red,
                            backgroundColor: Colors.green,
                          )
                          // Text(
                          //   "  8/6 hrs\nDaily limit\nexceeded",
                          //   style: TextStyle(
                          //     color: Colors.red,
                          //     fontSize: 20,
                          //   ),
                          // )
                        ],
                      ))),
                ],
              ))),
        ),
        SpannableGridCellData(
          id: 3,
          column: 3,
          row: 4,
          columnSpan: 2,
          rowSpan: 2,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 5, color: Color.fromARGB(255, 115, 115, 130)),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  color: Color.fromRGBO(240, 240, 240, 1)),
              alignment: Alignment.center,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Text(
                        'Daily Hydration',
                        style: TextStyle(fontSize: 19),
                      ))),
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: Stack(
                        children: [
                          LinearPercentIndicator(
                            alignment: MainAxisAlignment.center,
                            width: 160,
                            animation: true,
                            animateFromLastPercent: true,
                            lineHeight: 35.0,
                            animationDuration: 1000,
                            percent: 0.1 * _water,
                            progressColor: Color.fromARGB(255, 0, 141, 223),
                          ),
                          Image(
                            image: AssetImage("paharPB.png"),
                          ),
                        ],
                      ))),
                  Expanded(
                      flex: 1,
                      child: Center(
                          child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              Colors.deepPurple),
                        ),
                        onPressed: () {
                          setState(
                            () {
                              _water = _water + 1;
                              if (_water == 10) {
                                data[0][3] = true;
                                _completed_tasks += 1;
                              }
                            },
                          );
                        },
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Drank some water!',
                          style: TextStyle(fontSize: 15),
                        ),
                      )))
                ],
              )),
        ),
        SpannableGridCellData(
          id: 4,
          column: 1,
          row: 6,
          rowSpan: 2,
          columnSpan: 4,
          child: Container(
            child: Center(
                child: Text(
              "Quote of the day\n\n“A healthy outside starts from the inside.”\n\n   – Robert Urich – \n",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15),
            )),
            decoration: BoxDecoration(
                border: Border.all(
                    width: 5, color: Color.fromARGB(255, 115, 115, 130)),
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color.fromRGBO(240, 240, 240, 1)),
          ),
        ),
      ],
      columns: 4,
      rows: 7,
      style: SpannableGridStyle(
        spacing: 10,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    screens[0] = create_targets_page();
    screens[1] = create_home_page();
    screens[2] = create_profile_page();
    return Container(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(widget.title),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.deepPurpleAccent],
                ),
              ),
            ),
          ),
          body: Center(
            child: screens[_selectedIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  label: "Targets", icon: Icon(Icons.track_changes)),
              BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: "Profile", icon: Icon(Icons.person))
            ],
            selectedItemColor: Colors.deepPurple,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.deepPurpleAccent],
          ),
        ));
  }
}
