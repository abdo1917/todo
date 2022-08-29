import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class setting_providers extends ChangeNotifier {
  String current_language = 'en';
  ThemeMode current_Theme = ThemeMode.light;

  void changeLanguage (String NewLang) async{
    final prefs = await SharedPreferences.getInstance();

    if(NewLang==current_language){
      return ;
    }
    current_language= NewLang;
    prefs.setString('lang', current_language);
    notifyListeners();
  }

  void changeTheme(ThemeMode NewTheme) async{
    final prefs = await SharedPreferences.getInstance();

    if(current_Theme==NewTheme){
      return ;
    }
    current_Theme=NewTheme;
    prefs.setString('them', current_Theme== ThemeMode.light? 'light': 'dark');
    notifyListeners();
  }

  bool IsDark(){
    return current_Theme==ThemeMode.dark;
  }
  bool IsEn(){
    return current_language=='en';
  }

  String getMainBackgroung(){
    return IsDark()?
    'assets/images/Background_dark.png':
    'assets/images/background_pattern.png';
  }

  String getSebhaHead(){
    return IsDark()?
    'assets/images/head_sebha_dark.png':
    'assets/images/head_sebha_logo.png';
  }
  String getSebhaBody(){
    return IsDark()?
    'assets/images/body_sebha_dark.png':
    'assets/images/body_sebha_logo.png';
  }

}
