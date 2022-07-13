
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Models/TodoItemsModel.dart';

class TodoItems extends GetxController {

  var _todoitems = <TodoItemsModel>[].obs;
  RxList<TodoItemsModel> tempFilter = RxList.empty(growable: true);
  RxList<TodoItemsModel> refreshList = RxList.empty(growable: true);
  RxBool calenderFlagCheck = false.obs;
  static TodoItems get to => Get.find();

  @override
  void onInit(){
    super.onInit();
    readJson();
  }

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('jsons/todoItemlist.json');
    final data = await json.decode(response);
    _todoitems.addAll(List<TodoItemsModel>.from(data.map((i) => TodoItemsModel.fromJson(i))).toList());
    refreshList = _todoitems;
  }

  Future<RxList<TodoItemsModel>> remainingTodos(DateTime newdate) async {
    initwhenDateSelection();
    for(TodoItemsModel item in refreshList){
      if(item.deliveryTime?.compareTo(DateTime(newdate.year,newdate.month,newdate.day)) == 1)
      {
        tempFilter.add(item);
      }
    }
     _todoitems = tempFilter;
    return _todoitems;
  }

  List<TodoItemsModel> get items {
    return [..._todoitems];
  }

  void changeCalenderFlag(){
    calenderFlagCheck.toggle();
    if(calenderFlagCheck.isFalse){
      readJson();
    }
  }

  void initwhenDateSelection(){
    tempFilter.clear();
    tempFilter = RxList.empty(growable: true);
  }

}