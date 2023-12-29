import 'package:hive/hive.dart';
part 'enum_types.g.dart';

@HiveType(typeId: 7)
enum TaskTypeEnum {
  @HiveField(0)
  working,

  @HiveField(1)
  focus,

  @HiveField(2)
  date
}
