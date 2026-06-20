import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
 static late SharedPreferences prefs;

 static Future<void> init()async{

    prefs = await SharedPreferences.getInstance();
  }

    static void setNotIsFirst(){
     prefs.setBool('NotIsFirst',false);
  }
  static bool get isFirstTime{
    return prefs.getBool('NotIsFirst')??true;
  }

  void setIsFirst(){
   prefs.getString('email');
  }
  String get isEmail{
   return prefs.getString('email')??"";
  }
}