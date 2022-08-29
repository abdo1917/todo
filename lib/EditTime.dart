import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/my_theme.dart';
import 'package:todo/provider.dart';

import 'database/My_database.dart';
import 'database/task.dart';
import 'dialog_utils.dart';


class EditTask extends StatefulWidget {
  static const String routeName = 'EditTask';
  Task task;
  EditTask(this.task);

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  var formKey = GlobalKey<FormState>();
  late TasksProvider  provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),

        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Positioned(
                  top: 40,
                  left: 30,
                  right: 30,
                  bottom: 100,
                  child: Container(
                    width: size.width * .85,
                    height: size.height * .8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('Edit Task'),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'please New enter details';
                            }
                            return null;
                          },
                          onChanged: (String value){
                            widget.task.title = value;
                          },
                          initialValue: widget.task.title,
                          decoration: InputDecoration(
                            labelText: 'title',
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'please New enter details';
                            }
                            return null;
                          },
                          onChanged: (String value){
                            widget.task.content = value;
                          },
                          initialValue: widget.task.content,
                          decoration: InputDecoration(
                            labelText: 'Details',
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Text('Select date'),
                        SizedBox(
                          height: 29,
                        ),
                        InkWell( onTap: showDatePickerDialog,
                          child: Text(
                              ' ${selectedDate.year} / ${selectedDate.month} / ${selectedDate.day}  '),
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                          child: ElevatedButton(
                              onPressed: TaskEdit,
                              child: Text(
                                'Save Changes.',
                                style: TextStyle(fontSize: 24),
                              )),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),

          ),
        ),
      ),
    );
  }

  void onSubmet(){
    if(formKey.currentState!.validate()){
      print ('Done');
    }
  }

  void TaskEdit(){
    // Navigator.pop(context);
    MyDatabase.EditTask(widget.task).then((value)
    {
      provider.retrieveTasks();
      Navigator.pop(context);
    });
  }


  DateTime selectedDate = DateTime.now();

  void showDatePickerDialog()async{
    DateTime? dateTime = await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(dateTime!=null){
      selectedDate = dateTime;
      setState(() {});
    }
  }
}
