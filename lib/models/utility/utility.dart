import '../enum_types.dart';
import '../task_type.dart';

List<Tasktyle> get_task_type() {
  var list = [
    Tasktyle(
        images: 'images/meditate.png',
        title: 'مدتیشن',
        TasltypeEnum: TaskTypeEnum.focus),
    Tasktyle(
        images: 'images/social_frends.png',
        title: 'قرار',
        TasltypeEnum: TaskTypeEnum.date),
    Tasktyle(
        images: 'images/hard_working.png',
        title: 'کار عمیق',
        TasltypeEnum: TaskTypeEnum.working)
  ];
  return list;
}
