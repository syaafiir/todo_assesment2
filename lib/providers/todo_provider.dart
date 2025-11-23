import 'package:flutter/material.dart';
import '../models/todo_model.dart';
import '../services/db_helper.dart';
import '../services/prefs_service.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  // Load data dari SQLite
  Future loadTodos() async {
    _todos = await DBHelper.instance.getTodos();
    notifyListeners();
  }

  // Tambah data
  Future addTodo(String title) async {
    final newTodo = TodoModel(
      title: title,
      date: DateTime.now().toString(),
      isDone: 0,
    );

    await DBHelper.instance.insertTodo(newTodo);

    PrefsService.setLastInput(title);

    await loadTodos();
  }

  // Hapus data
  Future deleteTodo(int id) async {
    await DBHelper.instance.deleteTodo(id);
    await loadTodos();
  }

  // Update status
  Future toggleDone(TodoModel todo) async {
    final updated = TodoModel(
      id: todo.id,
      title: todo.title,
      date: todo.date,
      isDone: todo.isDone == 0 ? 1 : 0,
    );

    await DBHelper.instance.updateTodo(updated);
    await loadTodos();
  }
}
