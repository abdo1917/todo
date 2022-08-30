import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Language Bottom Sheet.dart';
import 'SettingProviders.dart';
import 'Theme Bottom Sheet.dart';

class SettingsTabs extends StatefulWidget {

  @override
  State<SettingsTabs> createState() => _SettingsTabsState();
}

class _SettingsTabsState extends State<SettingsTabs> {
  @override
  Widget build(BuildContext context) {
    var settingProvider = Provider.of<setting_providers>(context);

    return Container(
      padding: EdgeInsets.all(8),


    );
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
