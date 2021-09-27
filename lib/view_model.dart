import 'dart:async';
import 'package:mvvm/repository/repository_memory.dart';
import 'package:mvvm/task_model.dart';

class TaskViewModel {
  final _repository = RepositoryMemory();

  TaskModel? taskSelected;

  List<TaskModel> get tasks => _repository.list();

  final StreamController _controller = StreamController.broadcast();

  Stream get stream => _controller.stream;

  void saveTask(String description) {
    if (taskSelected == null) {
      final id = DateTime.now().microsecondsSinceEpoch.toString();
      _repository.create(TaskModel(description: description, id: id));
    } else {
      _repository.update(taskSelected!);
    }

    _controller.sink.add('');
  }

  void removeTask(TaskModel task) {
    if (task == taskSelected) {
      taskSelected = null;
    }
    _repository.remove(task);

    _controller.sink.add('');
  }

  void setTaskSelected(TaskModel task) {
    taskSelected = task;
  }
}
