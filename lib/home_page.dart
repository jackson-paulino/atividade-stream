import 'package:flutter/material.dart';
import 'package:mvvm/change_notifier_widget.dart';
import 'package:mvvm/task_model.dart';
import 'package:mvvm/view_model.dart';

class HomePage extends StatelessWidget {
  final viewModel = TaskViewModel();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de tarefas MVVM')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder(
              stream: viewModel.stream,
              builder: (context, _) {
                return TaskForm(viewModel);
              },
            ),
          ),
          Expanded(
              child: StreamBuilder(
            stream: viewModel.stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              return TaskList(
                viewModel.tasks,
                onPressedRemove: (task) {
                  viewModel.removeTask(task);
                },
                onPressed: (task) {
                  viewModel.setTaskSelected(task);
                },
              );
            },
          )),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final List<TaskModel> _tasks;
  final Function(TaskModel) onPressedRemove;
  final Function(TaskModel) onPressed;
  const TaskList(this._tasks,
      {Key? key, required this.onPressedRemove, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _tasks.length,
      itemBuilder: (_, i) {
        return ListTile(
          title: Text(_tasks[i].description),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle),
            onPressed: () {
              onPressedRemove(_tasks[i]);
            },
          ),
          onTap: () {
            onPressed(_tasks[i]);
          },
        );
      },
    );
  }
}

class TaskForm extends StatelessWidget {
  final _inputController = TextEditingController();

  final TaskViewModel _viewModel;

  TaskForm(this._viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_viewModel.taskSelected != null) {
      _inputController.text = _viewModel.taskSelected!.description;
    }

    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _inputController,
            decoration: const InputDecoration(
              label: Text('Descricao'),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            _viewModel.saveTask(_inputController.text);
            _inputController.clear();
          },
          child: const Text('Salvar'),
        ),
      ],
    );
  }
}
