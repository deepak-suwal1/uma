import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
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

    if (!isAuthenticated) {
      router.push(const LoginRoute());
      return;
    }

    resolver.next();
  }
}
