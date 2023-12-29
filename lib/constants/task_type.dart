import 'package:hive/hive.dart';

import 'enum_types.dart';
part 'task_type.g.dart';

@HiveType(typeId: 6)
class Tasktyle {
  Tasktyle({
    required this.images,
    required this.title,
    required this.TasltypeEnum,
  });
  @HiveField(0)
  String images;
  @HiveField(1)
  String title;
  @HiveField(2)
  TaskTypeEnum TasltypeEnum;
}
