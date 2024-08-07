import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:uhuru/core/constants/app_keys.dart';
import 'package:uhuru/core/session/session_manager.dart';
import 'package:uhuru/features/auth/data/model/login_response_model.dart';

@Injectable(as: SessionManager)
class SessionManagerImpl extends SessionManager {
  FlutterSecureStorage storage;

  SessionManagerImpl(this.storage);

  @override
  Future<String?> getRefreshToken() async {
    final token = await storage.read(key: refreshToken);
    return token;
  }

  @override
  Future<String?> getToken() async {
    final token = await storage.read(key: accessToken);
    return token;
  }

  @override
  Future<void> saveToken(String token) async {
    storage.write(key: accessToken, value: token);
  }

  @override
  Future<bool?> isAuthenticated() async {
    final token = await storage.read(key: accessToken);
    return token != null;
  }

  @override
  Future<void> saveUser(LoginResponseModel loginResponseModel) async {
    Future.wait([
      storage.write(key: accessToken, value: loginResponseModel.accessToken),
      storage.write(key: refreshToken, value: loginResponseModel.refreshToken),
    ]);
  }

  @override
  Future<void> clearSession() async {
    await storage.deleteAll();
  }
}
