import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uhuru/core/constants/app_keys.dart';

import 'app_config.dart';

@Injectable(as: AppConfig)
class AppConfigImpl extends AppConfig {
  @override
  Future<bool> hasShownOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(hasShownOnboardingKey) ?? false;
  }

  @override
  Future<void> markOnboardingAsShown() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(hasShownOnboardingKey, true);
  }
}
