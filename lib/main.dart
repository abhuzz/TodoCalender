import 'package:flutter/material.dart';
import 'package:flutter_advanced_calendar/flutter_advanced_calendar.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import 'package:practicaldigiwhiz/Models/TodoItemsModel.dart';
import 'package:practicaldigiwhiz/Utils/AppColors.dart';
import 'package:practicaldigiwhiz/Views/TodoListView.dart';
import 'package:practicaldigiwhiz/widgets/CalenderItemWidget.dart';

import 'ViewModels/TodoItems.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // TodayDate
  late String todaydate = DateTime.now().toString();
  final _calendercontroller = AdvancedCalendarController.today();
  final todoController = Get.put(TodoItems());
  final TodoItems controller = TodoItems.to;

  @override
  initState(){
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_){});
    _calendercontroller.addListener(() {
      controller.remainingTodos(_calendercontroller.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('E MM-dd-yy');
    todaydate = formatter.format(now);
    final List<DateTime> events = [
      DateTime.now(),
    ];

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(todaydate,style: Theme.of(context).textTheme.headline6,),
        backgroundColor: AppColors.backgroundColor,
        actions: [
          MaterialButton(onPressed: (){
            todoController.changeCalenderFlag();
          },
            child: Obx((){
              return todoController.calenderFlagCheck.isTrue
                  ? const Icon(Icons.cancel,
                color: Colors.black,
              ) :
              const Icon(Icons.calendar_month_rounded,
                color: Colors.black,
              );
            }),
          ),
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        children: [
          Obx((){
            return todoController.calenderFlagCheck.isTrue
                ? AdvancedCalendar(
              controller: _calendercontroller,
              events: events,
            )
                : const SizedBox(
              height: 0,
              width: 0,
            );
          }),
          GetX<TodoItems>(
              init: TodoItems(),
              builder: (newdata) {
                return ListView.builder(
                  itemCount: newdata.items.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext cntx,int index) => CalenderItemWidget(todoItemsModel: newdata.items[index]),
                );
              }
          ),
        ],
      )
    );
  }
}

