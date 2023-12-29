import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:time_pickerr/time_pickerr.dart';
import 'package:todo_app/constants/constants.dart';
import 'package:todo_app/task.dart';

class editTaskScreen extends StatefulWidget {
  editTaskScreen({Key? key, required this.task}) : super(key: key);
  Task task;
  @override
  State<editTaskScreen> createState() => _editTaskScreenState();
}

class _editTaskScreenState extends State<editTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  TextEditingController? textTaskTitle;
  TextEditingController? textTaskSubTitle;
  final box = Hive.box<Task>('TaskBox');

  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
    textTaskTitle = TextEditingController(text: widget.task.title);
    textTaskSubTitle = TextEditingController(text: widget.task.subTitle);
  }

  DateTime? _time;
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
              ElevatedButton(
                onPressed: () {
                  String TaskTittle = textTaskTitle!.text;
                  String TaskSubTittle = textTaskSubTitle!.text;
                  editTask(TaskTittle, TaskSubTittle);
                  Navigator.of(context).pop();
                },
                child: Text(
                  'ویرایش کردن تسک',
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

  editTask(String TaskTittle, String TaskSubTittle) {
    widget.task.title = TaskTittle;
    widget.task.subTitle = TaskSubTittle;
    widget.task.time = _time!;
    widget.task.save();
  }
}
