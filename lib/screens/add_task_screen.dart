import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:time_pickerr/time_pickerr.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/constants/task_type.dart';
import 'package:todo_app/constants/utility.dart';
import 'package:todo_app/task.dart';

class addTaskScreen extends StatefulWidget {
  const addTaskScreen({Key? key}) : super(key: key);

  @override
  State<addTaskScreen> createState() => _addTaskScreenState();
}

class _addTaskScreenState extends State<addTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  TextEditingController textTaskTitle = TextEditingController();
  TextEditingController textTaskSubTitle = TextEditingController();
  final box = Hive.box<Task>('TaskBox');
  DateTime? _time;
  int _selectTaskTypeItem = 0;

  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    focusNode: negahban1,
                    controller: textTaskTitle,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      labelText: 'عنوان تسک',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: negahban1.hasFocus ? green : gray,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: gray, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width: 3,
                          color: green,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 44),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextField(
                    maxLines: 2,
                    focusNode: negahban2,
                    controller: textTaskSubTitle,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                      labelText: 'توضیحات تسک',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: negahban2.hasFocus ? green : gray,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: gray, width: 3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(
                          width: 3,
                          color: green,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: CustomHourPicker(
                  title: 'انتخاب زمان',
                  positiveButtonText: 'انتخاب',
                  negativeButtonText: 'انصراف',
                  elevation: 1,
                  titleStyle: TextStyle(
                      color: green, fontWeight: FontWeight.bold, fontSize: 18),
                  positiveButtonStyle: TextStyle(
                      color: green, fontWeight: FontWeight.bold, fontSize: 18),
                  negativeButtonStyle: TextStyle(color: gray, fontSize: 18),
                  onNegativePressed: ((context) {}),
                  onPositivePressed: (context, time) {
                    _time = time;
                  },
                ),
              ),
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: get_task_type().length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: (() {
                          setState(() {
                            _selectTaskTypeItem = index;
                          });
                        }),
                        child: get_task_typs_list(get_task_type()[index], index,
                            _selectTaskTypeItem));
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  String TaskTittle = textTaskTitle.text;
                  String TaskSubTittle = textTaskSubTitle.text;
                  addTask(TaskTittle, TaskSubTittle);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'اضافه کردن تسک',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                    primary: green, minimumSize: Size(200, 40), elevation: 0.0),
              )
            ],
          ),
        ),
      )),
    );
  }

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

  addTask(String TaskTittle, String TaskSubTittle) {
    var task = Task(
        title: TaskTittle,
        subTitle: TaskSubTittle,
        time: _time!,
        tasktyle: get_task_type()[_selectTaskTypeItem]);
    box.add(task);
  }
}
