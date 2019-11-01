import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

class TodoModel extends Model {
  static TodoModel of(BuildContext context) =>
      ScopedModel.of<TodoModel>(context);

  List<Map<String, String>> _todos = [];

  List get todos => _todos;

  void addTodo(String title, String description) {
    _todos.add({'title': title, 'description': description});
    notifyListeners();
  }
}
