import 'package:mvvm/repository/repository_interface.dart';
import 'package:mvvm/task_model.dart';

class RepositoryMemory
    implements
        CreateInterface,
        RemoveInterface,
        UpdateInterface,
        ListInterface {
  final _tasks = <TaskModel>[];

  @override
  void create(TaskModel taskModel) {
    _tasks.add(taskModel);
  }

  @override
  void remove(TaskModel taskModel) {
    _tasks.removeWhere((task) => taskModel.id == task.id);
  }

  @override
  void update(TaskModel taskModel) {
    // TODO: implement update
  }

  @override
  List<TaskModel> list() {
    return _tasks;
  }
}
