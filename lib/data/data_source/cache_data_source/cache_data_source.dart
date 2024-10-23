import '../../network/app_prefs.dart';
import '../../services/user_manager.dart';

abstract class AppCacheDataSource {
  Future<void> saveToken();

  Future<Map<String, dynamic>?> fetchToken();

  Future<void> clearToken();
}

class AppCacheDataSourceImpl implements AppCacheDataSource {
  final AppPrefs _appPrefs;
  final UserManager _userManager;

  AppCacheDataSourceImpl(this._appPrefs, this._userManager);

  @override
  Future<void> saveToken() async {
    final token = _userManager.getCurrentPerson?.token;
    if (token != null) {
      await _appPrefs.saveToken(token);
    }
  }

  @override
  Future<void> clearToken() async {
    await _appPrefs.clearToken();
  }

  @override
  Future<Map<String, dynamic>?> fetchToken() async {
    final token = await _appPrefs.getToken();
    if (token != null) {
      return {'token': token};
    }
    return null;
  }
}
