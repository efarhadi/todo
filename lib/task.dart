import 'package:hive/hive.dart';
import 'package:todo_app/constants/task_type.dart';

part 'task.g.dart';

@HiveType(typeId: 5)
class Task extends HiveObject {
  Task(
      {required this.title,
      required this.subTitle,
      this.isDone = false,
      required this.time,
      required this.tasktyle});
  @HiveField(0)
  String title;
  @HiveField(1)
  String subTitle;

  @HiveField(2)
  bool isDone;

  @HiveField(3)
  DateTime time;

  @HiveField(4)
  Tasktyle tasktyle;
}
