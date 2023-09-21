import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../models/user_model.dart';
import '../prefs/pref_utils.dart';
import '../service/auth_services.dart';

class AuthController extends GetxController {
  User? user;
  bool isAuthenticated = false;

  Future<void> login(Map<String, String> credential) async {
    user = await GetIt.instance<AuthService>().login(credential);
    if (user != null) PrefUtils.setUser(user!);
  }

  Future<int?> register(Map<String, String> details) async {
    return await GetIt.instance<AuthService>().register(details);
  }
}
