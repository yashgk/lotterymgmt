import 'package:lotto_mgmt/core/models/user_model.dart';
import 'package:lotto_mgmt/core/network/network_helper.dart';

class AuthRepo {
  NetworkService networkService = NetworkService();

  Future<User> login(Map<String, String> credentials) async {
    late User user;
    try {
      var response = await networkService.post("/user/login", credentials);
      if (response.isNotEmpty) {
        user = User.fromJson(response['user']);
      }
    } catch (e) {
      rethrow;
    }
    return user;
  }

  Future<int> register(Map<String, String> details) async {
    late int userid;
    try {
      var response = await networkService.put("/user/register", details);
      if (response.isNotEmpty) {
        userid = response['id'];
      }
    } catch (e) {
      rethrow;
    }
    return userid;
  }
}
