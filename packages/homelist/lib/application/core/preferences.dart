import 'package:shared_preferences/shared_preferences.dart';

class PreferencesController {
  static late final SharedPreferences preferencesInstance;

  PreferencesController();

  static Future<void> initialise() async {
    try {
      preferencesInstance = await SharedPreferences.getInstance();
    } catch (_) {
      throw Exception("Error Initialising shared preferences");
    }
  }
}
