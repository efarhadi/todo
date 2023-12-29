import 'package:flutter/material.dart';
import 'package:todo_app/constants/constants.dart';

import '../constants/task_type.dart';

Widget get_task_typs_list(
    Tasktyle tasktype, int index, int selectTaskTypeItem) {
  return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 2,
            color:
                ((selectTaskTypeItem == index) ? green : Colors.transparent)),
        borderRadius: BorderRadius.circular(12),
      ),
      width: 140,
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [Image.asset(tasktype.images), Text(tasktype.title)],
      ));
}
