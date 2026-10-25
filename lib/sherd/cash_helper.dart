import 'package:shared_preferences/shared_preferences.dart';

import '../views/login/view.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static void setIsNotFistTime() {
    _prefs.setBool("isFirstTime", false);
  }

  static bool get isFirstTime {
    return _prefs.getBool("isFirstTime") ?? true;
  }

  static void setEmail(String email) {
    _prefs.setString("email", email);
  }

  static String get email {
    return _prefs.getString("email") ?? "";
  }

  static String get token {
    return _prefs.getString("token") ?? "";
  }

  static bool get isAuth {
    return token.isNotEmpty;
  }

  static Future<void> clearUserData() async {
    await _prefs.remove("token");
    await _prefs.remove("email");
    await _prefs.remove("phoneNumber");
    await _prefs.remove("countryCode");
    await _prefs.remove("otpCode");
    await _prefs.remove("otpExpiration");
    await _prefs.remove("profilePhotoUrl");
    await _prefs.remove("role");
    await _prefs.remove("username");
    await _prefs.remove("id");
  }

  static Future<void> saveUserData(UserData model) async {
    _prefs.setString("token", model.token);
    _prefs.setString("email", model.user.email);
    _prefs.setString("phoneNumber", model.user.phoneNumber);
    _prefs.setString("countryCode", model.user.countryCode);
    _prefs.setString("otpCode", model.user.otpCode);
    _prefs.setString("otpExpiration", model.user.otpExpiration);
    _prefs.setString("profilePhotoUrl", model.user.profilePhotoUrl);
    _prefs.setString("role", model.user.role);
    _prefs.setString("username", model.user.username);
    _prefs.setInt("id", model.user.id);
  }
}


