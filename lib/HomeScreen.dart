import 'package:flutter/material.dart';
import 'package:todo/Settings/Settings.dart';
import 'package:todo/Task/Task.dart';
import 'package:todo/addTaskBottom.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
                color: Colors.white, width: 4)),
        onPressed: (){
          showAddTaskBottomSheet();
        },
        child: Icon(
            Icons.add
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            selectedIndex = index;
            setState(() {

            });
          },
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: ''
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: ''
            ),
          ],
        ),
      ),
      body: tabs[selectedIndex],
    );
  }

  List<Widget>tabs = [TasksListTab(),SettingsTabs()];

  void showAddTaskBottomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return AddTaskBottomSheet();
    });
  }
}
