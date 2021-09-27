import 'package:mvvm/repository/repository_interface.dart';
import 'package:mvvm/task_model.dart';

class RepositoryPrefs
    implements
        CreateInterface,
        RemoveInterface,
        ListInterface,
        UpdateInterface {
  @override
  void create(TaskModel taskModel) {
    // TODO: implement create
  }

  @override
  void remove(TaskModel taskModel) {
    // TODO: implement remove
  }

  @override
  List<TaskModel> list() {
    return [];
  }

  @override
  void update(TaskModel taskModel) {
    // TODO: implement update
  }
}
