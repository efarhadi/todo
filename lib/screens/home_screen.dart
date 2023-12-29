import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/widgets/taks_widget.dart';

import '../models/task.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputtext = '';
  TextEditingController controller = TextEditingController();
  bool IsVisible = true;
  var box = Hive.box('names');
  var taskbox = Hive.box<Task>('TaskBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Visibility(
        visible: IsVisible,
        child: FloatingActionButton(
          onPressed: (() {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) {
                  return addTaskScreen();
                }),
              ),
            );
          }),
          backgroundColor: green,
          child: Image.asset('images/icon_add.png'),
        ),
      ),
      backgroundColor: Color(0xffe5e5e5),
      body: Center(
          child: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if (notification.direction == ScrollDirection.forward) {
            setState(() {
              IsVisible = true;
            });
          }
          if (notification.direction == ScrollDirection.reverse) {
            setState(() {
              IsVisible = false;
            });
          }

          return true;
        },
        child: ValueListenableBuilder(
            valueListenable: taskbox.listenable(),
            builder: ((context, value, child) {
              return ListView.builder(
                itemCount: taskbox.length,
                itemBuilder: (BuildContext context, int index) {
                  var tasKs = taskbox.values.toList()[index];
                  return Dismissible(
                    onDismissed: (direction) {
                      tasKs.delete();
                    },
                    key: UniqueKey(),
                    child: TaskWidget(task: tasKs),
                  );
                },
              );
            })),
      )),
    );
  }
}
