import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/constants/task_type.dart';

import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/screens/add_task_screen.dart';
import 'package:todo_app/screens/test_screen.dart';
import 'package:todo_app/task.dart';

import 'constants/enum_types.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('names');
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TasktyleAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());
  await Hive.openBox<Task>('TaskBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'sh'),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
