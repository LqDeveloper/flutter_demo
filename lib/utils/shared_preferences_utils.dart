
import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  static SharedPreferences? _preferences;

  static SharedPreferences get preference => _preferences!;

  static initSP() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
