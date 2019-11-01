import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/TodoModel.dart';

Future<void> openCustomBottomModal(BuildContext ctx) {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final todoRef = ScopedModel.of<TodoModel>(ctx);

  return showModalBottomSheet(
      context: ctx,
      builder: (_) => SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                        labelText: 'Title', border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _descriptionController,
                    maxLines: 3,
                    decoration: InputDecoration(
                        labelText: 'Description', border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    child: Text('Add Todo'),
                    onPressed: () => todoRef.addTodo(
                        _titleController.text, _descriptionController.text),
                  )
                ],
              ),
            ),
          ));
}
