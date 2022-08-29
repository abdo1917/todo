import 'package:flutter/material.dart';

import 'Language Bottom Sheet.dart';
import 'Theme Bottom Sheet.dart';

class SettingsTabs extends StatefulWidget {

  @override
  State<SettingsTabs> createState() => _SettingsTabsState();
}

class _SettingsTabsState extends State<SettingsTabs> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void showLanguageButtomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return Language_Bottom_Sheet();
    });
  }

  void showThemeButtomSheet(){
    showModalBottomSheet(context: context, builder: (buildContext){
      return Theme_Bottom_Sheet();
    });
  }
}
