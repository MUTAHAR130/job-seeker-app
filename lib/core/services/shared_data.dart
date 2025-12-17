import 'package:shared_preferences/shared_preferences.dart';

final class SharedData {
  SharedData._();

  static SharedPreferences? _preferences;

  static bool isInitialized = false;

  static Future<void> initPrefs() async {
    _preferences = await SharedPreferences.getInstance();

    isInitialized = true;
  }

  static bool containKey(String key) {
    if (_preferences != null) {
      return _preferences!.containsKey(key);
    } else {
      throw Exception(
        "Preference not initialized, use SharedData.initPrefs first",
      );
    }
  }

  static Future<bool> clear() async {
    return (await _preferences?.clear() ?? false);
  }

  static Future<void> removeKey(String key) async {
    if (_preferences != null) {
      await _preferences!.remove(key);
    } else {
      throw Exception(
        "Preference not initialized, use SharedData.initPrefs first",
      );
    }
  }

  static void setPrefsString(String key, String value) {
    if (_preferences != null) {
      _preferences!.setString(key, value);
    } else {
      throw Exception(
        "Preference not initialized, use SharedData.initPrefs first",
      );
    }
  }

  static String getPrefsString(String key) {
    if (_preferences != null) {
      if (_preferences!.containsKey(key)) {
        return _preferences!.getString(key) ?? "";
      } else {
        throw Exception("Preference do not contain $key");
      }
    } else {
      throw Exception(
        "Preference not initialized, use SharedData.initPrefs first",
      );
    }
  }

  static void setPrefsInt(String key, int value) {
    if (_preferences != null) {
      _preferences!.setInt(key, value);
    } else {
      throw Exception(
        "Preference not initialized, use SharedData.initPrefs first",
      );
    }
  }

  static int getPrefsInt(String key) {
    if (_preferences != null) {
      if (_preferences!.containsKey(key)) {
        return _preferences!.getInt(key) ?? 0;
      } else {
        throw Exception("Preference do not contain $key");
      }
    } else {
      throw Exception(
        "Preference not initialized, use SharedData.initPrefs first",
      );
    }
  }

  static void setPrefsBool(String key, bool value) {
    if (_preferences != null) {
      _preferences!.setBool(key, value);
    } else {
      throw Exception(
        "Preference not initialized, use SharedData.initPrefs first",
      );
    }
  }

  static bool getPrefsBool(String key) {
    if (_preferences != null) {
      if (_preferences!.containsKey(key)) {
        return _preferences!.getBool(key) ?? false;
      } else {
        throw Exception("Preference do not contain $key");
      }
    } else {
      throw Exception(
        "Preference not initialized, use SharedData.initPrefs first",
      );
    }
  }
}
