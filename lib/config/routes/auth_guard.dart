import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:uhuru/config/app_config.dart';
import 'package:uhuru/core/injection/injection.dart';
import 'package:uhuru/core/session/session_manager.dart';

import 'app_router.gr.dart';

@injectable
class AuthGuard extends AutoRouteGuard {
  SessionManager sessionManager;

  AuthGuard(this.sessionManager);

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final isAuthenticated = await sessionManager.isAuthenticated() ?? false;
    final hasShownOnboarding = await getIt<AppConfig>().hasShownOnboarding();

    if (!hasShownOnboarding) {
      router.push(const WelcomeRoute());
    } else if (!isAuthenticated) {
      router.push(LoginSignUpRoute());
    } else {
      resolver.next();
    }
  }
}
