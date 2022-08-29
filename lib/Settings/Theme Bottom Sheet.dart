import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';

import 'SettingProviders.dart';

class Theme_Bottom_Sheet extends StatefulWidget {
  @override
  State<Theme_Bottom_Sheet> createState() => _Theme_Bottom_SheetState();
}

class _Theme_Bottom_SheetState extends State<Theme_Bottom_Sheet> {
  @override
  Widget build(BuildContext context) {

    var settingProvider = Provider.of<setting_providers>(context);
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(
              onTap: () {
                settingProvider.changeTheme(ThemeMode.dark);
              },
              child:
                  settingProvider.IsDark()?
                  getSelectedItem('Dark'):getUnselectedItem('Dark')),
          SizedBox(
            height: 12,
          ),
          InkWell(
              onTap: () {
                settingProvider.changeTheme(ThemeMode.light);
              },
              child:
                  settingProvider.IsDark()?
                  getUnselectedItem('light'):getSelectedItem('light'))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Theme.of(context).primaryColor),
        ),
        Icon(
          Icons.check_circle_rounded,
          color: Theme.of(context).primaryColor,
        )
      ],
    );
  }

  Widget getUnselectedItem(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).textTheme.headline5),
      ],
    );
  }
}
