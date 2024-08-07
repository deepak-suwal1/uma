import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:uhuru/config/app_config.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/injection/injection.dart';
import 'package:uhuru/features/common/presentation/widgets/app_button.dart';
import 'package:uhuru/features/onboarding/presentation/widgets/custom_stepper_widget.dart';
import 'package:uhuru/features/onboarding/presentation/widgets/onboarding_first.dart';
import 'package:uhuru/features/onboarding/presentation/widgets/onboarding_second.dart';
import 'package:uhuru/features/onboarding/presentation/widgets/onboarding_third.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int selectedIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(32),
        child: AppButton(
          buttonText: 'Continue',
          iconWidget: SvgPicture.asset(
            arrowUp,
            color: blackColor,
          ),
          onPressed: () async {
            if (selectedIndex < 2) {
              selectedIndex++;
              pageController.animateToPage(
                selectedIndex,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            } else {
              getIt<AppConfig>().markOnboardingAsShown();
              context.router
                  .pushAndPopUntil(LoginSignUpRoute(), predicate: (p) => false);
            }
          },
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                CustomStepperWidget(
                  totalSteps: 3,
                  currentStep: selectedIndex,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: PageView(
                      onPageChanged: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      controller: pageController,
                      children: const [
                        OnboardingFirst(),
                        OnboardingSecond(),
                        OnboardingThird(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: const WormEffect(
                    activeDotColor: blackColor,
                    dotColor: borderColor,
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 6,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
