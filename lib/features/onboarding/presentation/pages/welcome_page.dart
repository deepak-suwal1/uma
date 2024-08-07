import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/constants/app_colors.dart';
import 'package:uhuru/core/constants/assets.dart';
import 'package:uhuru/core/constants/constants.dart';
import 'package:uhuru/core/utils/extension.dart';
import 'package:uhuru/features/common/presentation/widgets/app_button.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(welcomeImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.4442, 0.6159, 1.0],
              colors: [
                Colors.transparent,
                Color.fromRGBO(0, 0, 0, 0.520389),
                blackColor,
              ],
            ),
          ),
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset(
                  welcomeLogo,
                  width: 120,
                  height: 120,
                ),
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          context.router.replace(LoginSignUpRoute());
                        },
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: bdLifelessGroteskMedium,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to UMA',
                          style: TextStyle(
                            fontSize: 32,
                            height: 1.2,
                            color: whiteColor,
                            fontFamily: bdLifelessGroteskMedium,
                          ),
                        ),
                        12.verticalSpace,
                        const Text(
                          'Our marketplace is filled with a diverse range of items from talented sellers around the world.',
                          style: TextStyle(
                            fontSize: 14,
                            color: whiteColor,
                            fontFamily: bdLifelessGroteskRegular,
                          ),
                        ),
                        40.verticalSpace,
                        AppButton(
                          buttonText: 'Get Started',
                          iconWidget: SvgPicture.asset(
                            arrowUp,
                            colorFilter: const ColorFilter.mode(
                              blackColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          onPressed: () {
                            context.router.push(OnboardingRoute());
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
