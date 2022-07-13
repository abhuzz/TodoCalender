import 'package:flutter/material.dart';
import 'package:practicaldigiwhiz/Models/TodoItemsModel.dart';
import 'package:practicaldigiwhiz/Utils/AppColors.dart';

class CalenderItemWidget extends StatelessWidget {

  TodoItemsModel todoItemsModel;
  CalenderItemWidget({Key? key,required this.todoItemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text("${todoItemsModel.title}",style: Theme.of(context).textTheme.titleMedium),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(24),bottomLeft: Radius.circular(24)),
                  color: Utils().setColortodoStatus(todoItemsModel.statusValue!)
                ),
                child: Text(Utils().setStringtodoStatus(todoItemsModel.statusValue!),style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${todoItemsModel.category}",style: Theme.of(context).textTheme.labelLarge,),
                const SizedBox(height: 8,),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.access_time,size: 20,),
                        const SizedBox(width: 8,),
                        Text(Utils().timeFormate(todoItemsModel.deliveryTime!),style: Theme.of(context).textTheme.labelLarge,),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.timer,size: 20,),
                        const SizedBox(width: 8,),
                        Text('${todoItemsModel.etaTime}'),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                Row(
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,size: 20,),
                        const SizedBox(width: 8,),
                        SizedBox(
                          width: MediaQuery.of(context).size.width-200,
                            child: Text("${todoItemsModel.address}",maxLines: 3,)
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(Icons.social_distance_rounded),
                        const SizedBox(width: 8,),
                        Text('${todoItemsModel.distance}',maxLines: 2,),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
