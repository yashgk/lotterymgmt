import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/prefs/shared_pref_keys.dart';
import 'package:lotto_mgmt/core/models/user_model.dart';
import 'package:lotto_mgmt/core/prefs/shared_prefs.dart';

class PrefUtils {
  static late SharedPrefs prefs;

  PrefUtils.init() {
    prefs = SharedPrefs();
  }

  static void setUser(User user) {
    prefs.setString(SharedPrefKeys.kUser, json.encode(user));
    prefs.setBool(SharedPrefKeys.kIsUserLoggedIn, true);
  }

  static Future<User?> getUser() async {
    String userJson = await prefs.getString(SharedPrefKeys.kUser) ?? "";

    return userJson != "" ? User.fromJson(json.decode(userJson)) : null;
  }

  static Future<bool> isUserLoggedIn() async {
    bool? result = false;
    try {
      result = await prefs.getBool(SharedPrefKeys.kIsUserLoggedIn) ?? false;
    } catch (e) {
      debugPrint(
          "error while checking if user logged in or not, error : ${e.toString()}");
    }
    return result!;
  }

  static Future<bool> clearAll() async {
    return await prefs.removeAll();
  }
}
