import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uhuru/config/routes/app_router.gr.dart';
import 'package:uhuru/core/constants/assets.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.router.replace(const WelcomeRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            splashBg,
            fit: BoxFit.cover,
          ),
          Center(
            child: SvgPicture.asset(
              splashLogo,
              width: 120,
              height: 120,
            ),
          ),
        ],
      ),
    );
  }
}
