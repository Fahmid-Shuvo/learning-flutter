import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/TodoModel.dart';
import './CustomBottomModal.dart';

class CustomScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todos = ScopedModel.of<TodoModel>(context).todos;
    return Scaffold(
        appBar: AppBar(
          title: Text('Scoped Model Todo'),
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: Text('Add Todo'),
          icon: Icon(Icons.add),
          onPressed: () => openCustomBottomModal(context),
        ),
        body: Container(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final title = todos[index]['title'];
              final description = todos[index]['description'];
              return Card(
                child: ListTile(
                  title: Text('$title'),
                  subtitle: Text('$description'),
                ),
              );
            },
          ),
        ));
  }
}
