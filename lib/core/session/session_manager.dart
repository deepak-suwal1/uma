import 'package:uhuru/features/auth/data/model/login_response_model.dart';

abstract class SessionManager {
  Future<bool?> isAuthenticated();

  Future<bool?> isCheckedIn();

  Future<String?> getToken();

  Future<String?> getRefreshToken();

  Future<void> saveToken(String token);

  Future<void> saveCheckedIn(String checkedIn);

  Future<void> saveUser(LoginResponseModel loginResponseModel);

  Future<void> clearSession();
}
