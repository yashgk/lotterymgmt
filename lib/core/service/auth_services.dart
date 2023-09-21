import 'package:lotto_mgmt/core/models/user_model.dart';
import 'package:lotto_mgmt/core/repo/auth_repo.dart';

class AuthService {
  AuthRepo authRepo = AuthRepo();

  Future<User?> login(Map<String, String> credentials) async {
    return await authRepo.login(credentials);
  }

  Future<int?> register(Map<String, String> details) async {
    return await authRepo.register(details);
  }
}
