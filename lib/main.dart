import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:lotto_mgmt/core/service_locator.dart';
import 'app.dart';
import 'core/prefs/pref_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  PrefUtils.init();
  Beamer.setPathUrlStrategy();
  runApp(MyApp());
}
