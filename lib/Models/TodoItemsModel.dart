
import 'package:practicaldigiwhiz/Utils/AppColors.dart';

class TodoItemsModel {

  int? id;
  String? title;
  StatusValue? statusValue;
  String? category;
  DateTime? deliveryTime;
  String? etaTime;
  String? address;
  String? distance;

  TodoItemsModel({
    this.id,
    this.title,
    this.statusValue,
    this.category,
    this.deliveryTime,
    this.etaTime,
    this.address,
    this.distance
  });

  TodoItemsModel.fromJson(Map<String,dynamic> json){
    id = json['id'];
    title = json['title'];
    statusValue = Utils().settodoStatus(json['statusValue']);
    category = json['category'];
    deliveryTime = Utils().todateFormate(json['deliveryTime']);
    etaTime = json['etaTime'];
    address = json['address'];
    distance = json['distance'];
  }

}
