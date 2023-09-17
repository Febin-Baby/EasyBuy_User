import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import GetX

class DarkAndLightTheme extends GetxController {
  static const THEME_STATUS = 'THEME_STATUS';
  // ignore: prefer_final_fields
  RxBool _darkTheme = false.obs; // Use RxBool for reactive updates

  bool get getIsDarkTheme => _darkTheme.value;

  DarkAndLightTheme() {
    getTheme();
  }

  setDarkTheme({required bool themeValue}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(THEME_STATUS, themeValue);
    _darkTheme.value = themeValue; // Update the RxBool value
  }

  Future<void> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _darkTheme.value = prefs.getBool(THEME_STATUS) ?? false; // Update the RxBool value
  }
}