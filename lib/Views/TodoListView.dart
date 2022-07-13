import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ViewModels/TodoItems.dart';
import '../widgets/CalenderItemWidget.dart';

class TodolistView extends StatelessWidget {
  TodolistView({Key? key}) : super(key: key);
// fetch todolist
//   final _todos = Get.put(TodoItems());
  @override
  Widget build(BuildContext context) {
    return GetX<TodoItems>(
      init: TodoItems(),
      builder: (newdata) {
        return ListView.builder(
          itemCount: newdata.items.length,
          itemBuilder: (BuildContext cntx,int index) => CalenderItemWidget(todoItemsModel: newdata.items[index]),
        );
      }
    );
  }
}
