import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'config/app_theme.dart';
import 'config/routes/app_router.dart';
import 'core/injection/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  await initHiveForFlutter();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: AppTheme.darkTheme,
    );
  }
}
