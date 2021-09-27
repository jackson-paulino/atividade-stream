import 'package:mvvm/task_model.dart';
abstract class CreateInterface {
  void create(TaskModel taskModel);
}

 abstract class RemoveInterface {
   void remove(TaskModel taskModel);
 }

 abstract class UpdateInterface {
   void update(TaskModel taskModel);
 }


abstract class ListInterface {
  List<TaskModel> list();
}