import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:todo_app/screens/edit_task_screen.dart';

import '../constants/constants.dart';
import '../task.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return getTask();
  }

  Widget getTask() {
    return InkWell(
      onTap: (() {
        setState(() {
          isChecked = !isChecked;
          widget.task.isDone = isChecked;
          widget.task.save();
        });
      }),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        height: 132,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: getMainItems(),
        ),
      ),
    );
  }

  Widget getMainItems() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // MSHCheckbox(
                  //   size: 28,
                  //   value: widget.task.isDone,
                  //   colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                  //     checkedColor: green,
                  //   ),
                  //   style: MSHCheckboxStyle.fillScaleCheck,
                  //   onChanged: (selected) {},
                  // ),
                  Checkbox(value: widget.task.isDone, onChanged: (selected) {}),
                  Expanded(
                    child: Text(
                      widget.task.title,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
              Text(
                widget.task.subTitle,
                overflow: TextOverflow.ellipsis,
              ),
              Spacer(),
              getTimeAndEditBadge()
            ],
          ),
        ),
        SizedBox(
          width: 15,
        ),
        Image.asset('${widget.task.tasktyle.images}'),
      ],
    );
  }

  Widget getTimeAndEditBadge() {
    return Row(
      children: [
        Container(
          height: 28,
          width: 83,
          decoration: BoxDecoration(
            color: green,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            child: Row(
              children: [
                Text(
                  '${widget.task.time.hour}:${get0BeforeMin(widget.task.time.minute)}',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                SizedBox(
                  width: 5,
                ),
                Image.asset('images/icon_time.png')
              ],
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: (() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return editTaskScreen(
                task: widget.task,
              );
            }));
          }),
          child: Container(
            height: 28,
            width: 90,
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Text(
                    'ویرایش',
                    style: TextStyle(
                      color: green,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Image.asset('images/icon_edit.png')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String get0BeforeMin(int TimeMinute) {
    if (TimeMinute < 10) {
      return '0${TimeMinute}';
    } else {
      return TimeMinute.toString();
    }
  }
}
