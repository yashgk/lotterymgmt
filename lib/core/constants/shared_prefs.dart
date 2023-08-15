import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// Share Preference Storage
class SharedPreference {
  static late SharedPreferences _prefs;

  static String kToken = "token";
  static String kId = "id";

  static Future<dynamic> _getInstance() async => _prefs = await SharedPreferences.getInstance();

  static Future<String?> get(String key) async {
    await _getInstance();
    return _prefs.getString(key);
  }

  static Future<Map<String, dynamic>?> getMap(String key) async {
    await _getInstance();
    String? data = _prefs.getString(key);
    try {
      return jsonDecode(data!);
    } catch (e) {
      return null;
    }
  }

  static Future setMap(String key, Map<String, dynamic> data) async {
    await _getInstance();
    try {
      _prefs.setString(key, jsonEncode(data));
    } catch (e) {
      print(e);
    }
  }

  static Future<int?> getInt(String key) async {
    await _getInstance();
    return _prefs.getInt(key);
  }

  static Future<List<dynamic>?> getStringList(String key) async {
    await _getInstance();
    return _prefs.getStringList(key);
  }

  static Future set(String key, dynamic value) async {
    await _getInstance();
    _prefs.setString(key, value);
  }

  static Future setInt(String key, dynamic value) async {
    await _getInstance();
    _prefs.setInt(key, value);
  }

  static Future setBool(String key, dynamic value) async {
    await _getInstance();
    _prefs.setBool(key, value);
  }

  static Future<bool?> getBool(String key) async {
    await _getInstance();
    return _prefs.getBool(key);
  }

  static void setList(String key, List<dynamic> value) async {
    await _getInstance();
    _prefs.setStringList(key, value as List<String>);
  }

  static Future remove(String key) async {
    await _getInstance();
    _prefs.remove(key);
  }

  static Future logout() async {
    await _getInstance();
    _prefs.clear();
  }
}
