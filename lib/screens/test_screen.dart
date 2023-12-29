import 'package:flutter/material.dart';

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  int num = 0;
  ValueNotifier notifires = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ValueListenableBuilder(
                  valueListenable: notifires,
                  builder: ((context, value, child) {
                    return Text(
                      '$value',
                      style: TextStyle(fontSize: 28),
                    );
                  })),
              ElevatedButton(
                  onPressed: () {
                    notifires.value = notifires.value + 1;
                  },
                  child: Text('add')),
            ],
          ),
        ),
      ),
    );
  }
}
