import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SettingProviders.dart';

class Language_Bottom_Sheet extends StatefulWidget {

  @override
  State<Language_Bottom_Sheet> createState() => _Language_Bottom_SheetState();
}

class _Language_Bottom_SheetState extends State<Language_Bottom_Sheet> {
  @override
  Widget build(BuildContext context) {
    var settingProvider= Provider.of<setting_providers>(context);
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        children: [
          InkWell(onTap: (){settingProvider.changeLanguage('en');},
              child: 
              settingProvider.current_language=='en'?
              getSelectedItem('English'):getUnselectedItem('English')),
          SizedBox(height: 12,),
          InkWell(onTap: (){settingProvider.changeLanguage('ar');},
              child:
              settingProvider.current_language == 'ar'?
              getSelectedItem('العربية'):getUnselectedItem('العربية'))
        ],
      ),
    );
  }

  Widget getSelectedItem(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).textTheme.headline5?.copyWith(color: Theme.of(context).primaryColor),),
        Icon(Icons.check_circle_rounded, color: Theme.of(context).primaryColor,)
      ],
    );
  }

  Widget getUnselectedItem(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: Theme.of(context).textTheme.headline5),
        ],
    );
  }
}
