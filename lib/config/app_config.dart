abstract class AppConfig {
  Future<bool> hasShownOnboarding();

  Future<void> markOnboardingAsShown();
}
