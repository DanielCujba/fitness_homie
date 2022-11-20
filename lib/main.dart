import 'package:flutter/material.dart';
import 'package:spannable_grid/spannable_grid.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
          )),
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
  int _selectedIndex = 1;
  int counter = 0;
  bool _value = false;
  int _completed_tasks = 10;
  List<Widget> tasks = [];
  final tasks_progress = [];
  int _total_tasks = 15;

  final screens = [];

  void set_total_tasks() {
    _total_tasks = tasks.length;
  }

  void onChanged(value) {
    setState(() {
      _value = value;
      if (value) {
        _completed_tasks += 1;
      } else {
        _completed_tasks -= 1;
      }
    });
  }

  void add_task(task_name, {goal = Null}) {
    setState(() {
      ;
      Row task = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            task_name,
            style: TextStyle(color: Colors.black, fontSize: 20),
          )
        ],
      );

      if (goal == Null) {
        tasks_progress.add(false);
        task.children.add(Checkbox(value: this._value, onChanged: onChanged));
      } else {
        tasks_progress.add(0);
        task.children.add(CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 5.0,
          percent: 1.0,
          center: new Text("${tasks_progress[tasks_progress.length]}"),
          progressColor: Colors.green,
        ));
        // task.children.add();
      }
      Container t = Container(
        margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color.fromRGBO(235, 235, 235, 1),
            borderRadius: BorderRadius.circular(8)),
        child: task,
      );
      tasks.add(task);
    });
  }

  void onPressed() {
    setState(() {
      _total_tasks += 1;
      add_task("Name");
    });
  }

  void create_profile_page() {
    setState(() {
      screens.add(
        Stack(
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
                        'Boss',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                "Cats, Basketball, Guitar",
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
                            'Achievements',
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 14.0),
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
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 14.0),
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
                            style: TextStyle(
                                color: Colors.grey[400], fontSize: 14.0),
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
        ),
      );
    });
  }

  void create_targets_page() {
    setState(() {
      screens.add(
        SpannableGrid(
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
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
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
                child: ListView(
                  children: tasks,
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
        ),
      );
    });
  }

  void create_home_page() {
    setState(() {
      screens.add(
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
      );
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    create_targets_page();
    create_home_page();
    create_profile_page();
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
