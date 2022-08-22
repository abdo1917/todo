import 'package:flutter/material.dart';
import 'package:todo/Settings/Settings.dart';
import 'package:todo/Task/Task.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectedIndex=0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
        Text('Todo'),),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: SelectedIndex,
          onTap: (index){
            SelectedIndex=index;
            setState((){});
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list) ,label: 'Task list'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:FloatingActionButton(
        shape: StadiumBorder(
          side: BorderSide(color: Colors.white,width: 4),
        ),
        child: Icon(Icons.add),
        onPressed: (){},
      ),
      body: Tabs[SelectedIndex],
    );
  }
  var Tabs= [TaskTab(),SettingsTabs()];

}
