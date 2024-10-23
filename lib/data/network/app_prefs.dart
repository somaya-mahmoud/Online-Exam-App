import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AppPrefs {
  Future<void> saveToken(String token);
  Future<String?> getToken();
  Future<void> clearToken();
  bool containKey(String key);
  Future<void> removeKey(String key);
  String? getString(String key);
  int? getInt(String key);
  bool? getBool(String key);
  double? getDouble(String key);
  Map<String, dynamic>? getMap(String key);
  DateTime? getDateTime(String key);
  Future<List<String>?> getStringList(String key);
  Future<void> setString(String key, String value);
  Future<void> setInt(String key, int value);
  Future<void> setBool(String key, bool value);
  Future<void> setDouble(String key, double value);
  Future<void> setStringList(String key, List<String> value);
  Future<void> setMap(String key, Map<String, dynamic> value);
  Future<void> setDateTime(String key, DateTime value);
}

class AppPrefsImpl implements AppPrefs {
  final SharedPreferences _sharedPreferences;

  AppPrefsImpl(this._sharedPreferences);

  Future<void> saveToken(String token) async {
    await setString('auth_token', token);
  }

  Future<String?> getToken() async {
    return getString('auth_token');
  }

  Future<void> clearToken() async {
    await removeKey('auth_token');
  }

  @override
  int? getInt(String key) => _sharedPreferences.getInt(key);

  @override
  String? getString(String key) => _sharedPreferences.getString(key);

  @override
  bool? getBool(String key) => _sharedPreferences.getBool(key);

  @override
  double? getDouble(String key) => _sharedPreferences.getDouble(key);

  @override
  Future<void> setBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  @override
  Future<void> setDouble(String key, double value) async {
    await _sharedPreferences.setDouble(key, value);
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _sharedPreferences.setInt(key, value);
  }

  @override
  Future<void> setString(String key, String value) async {
    await _sharedPreferences.setString(key, value);
  }

  @override
  bool containKey(String key) => _sharedPreferences.containsKey(key);

  @override
  Future<void> removeKey(String key) async {
    await _sharedPreferences.remove(key);
  }

  @override
  Future<List<String>?> getStringList(String key) async {
    return _sharedPreferences.getStringList(key);
  }

  @override
  Future<void> setStringList(String key, List<String> value) async {
    await _sharedPreferences.setStringList(key, value);
  }

  @override
  Map<String, dynamic>? getMap(String key) {
    return containKey(key) ? json.decode(getString(key)!) : null;
  }

  @override
  Future<void> setMap(String key, Map<String, dynamic> value) async {
    await setString(key, json.encode(value));
  }

  @override
  DateTime? getDateTime(String key) {
    return containKey(key)
        ? DateTime.fromMillisecondsSinceEpoch(getInt(key)!)
        : null;
  }

  @override
  Future<void> setDateTime(String key, DateTime value) async {
    int millis = value.millisecondsSinceEpoch;
    await setInt(key, millis);
  }
}
