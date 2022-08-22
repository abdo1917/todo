import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo/my_theme.dart';

class TaskWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: DrawerMotion(),
        children: [
          SlidableAction(onPressed: (_){

          }
          ,icon: Icons.delete,
          backgroundColor: MyTheme.red,
          label: 'Delete',
          borderRadius: BorderRadius.circular(8),)
        ],
      ),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).primaryColor,
              ),
              width: 8,
              height: 80,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Titel',style: Theme.of(context).textTheme.titleLarge,),
                  Text('desc',style: Theme.of(context).textTheme.bodyMedium,),
                ],

              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).primaryColor
              ) ,
              child: Icon(Icons.check, color: Colors.white,),)
          ],
        ),
      ),
    );
  }
}
