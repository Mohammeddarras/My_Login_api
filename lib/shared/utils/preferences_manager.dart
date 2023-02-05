import 'package:shared_preferences/shared_preferences.dart';

class PreferencesManager {
  static PreferencesManager? _instance;

  PreferencesManager._();

  factory PreferencesManager() => _instance ??= PreferencesManager._();

  static SharedPreferences? _preferences;

  Future initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static int? getInt(final String key, [final int? defaultValue]) =>
      _preferences!.getInt(key) ?? defaultValue;

  static num? getNum(final String key, [final num? defaultValue]) {
    final value = _preferences!.get(key);
    if (value is! num) return defaultValue;
    return defaultValue;
  }

  static String? getString(final String key, [final String? defaultValue]) =>
      _preferences!.getString(key) ?? defaultValue;

  static bool? getBool(final String key, [final bool? defaultValue]) =>
      _preferences!.getBool(key) ?? defaultValue;

  static double? getDouble(final String key, [final double? defaultValue]) =>
      _preferences!.getDouble(key) ?? defaultValue;

  static Future<bool> setInt(final String key, final int value) async {
    return _preferences!.setInt(key, value);
  }

  static Future<bool> setNum(final String key, final num value) async {
    if (value is int) return setInt(key, value);
    if (value is double) return setDouble(key, value);
    throw Exception(
        'Your are trying to set the value: $value but it\'s not a number!');
  }

  static Future<bool> setString(final String key, final String value) async {
    return _preferences!.setString(key, value);
  }

  static Future<bool> setBool(final String key, final bool value) async {
    return _preferences!.setBool(key, value);
  }

  static Future<bool> setDouble(final String key, final double value) async {
    return _preferences!.setDouble(key, value);
  }

  static Future<bool> remove(final String key) async {
    return _preferences!.remove(key);
  }
}
