import 'package:auto_route/auto_route.dart';
import 'package:uhuru/core/injection/injection.dart';

import 'app_router.gr.dart';
import 'auth_guard.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: LoginSignUpRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: OtpVerificationRoute.page),
        AutoRoute(page: ForgotPasswordRoute.page),
        AutoRoute(page: ResetPasswordRoute.page),
        AutoRoute(
          page: DashboardRoute.page,
          guards: [getIt<AuthGuard>()],
          children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: HomeRoute.page),
          ],
        ),
      ];
}
