import 'package:flutter/material.dart';
import 'package:gitdesktop/main/injection.dart';
import 'package:gitdesktop/presentation/config/router.dart';
import 'package:gitdesktop/presentation/config/theme.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  windowManager.setMinimumSize(const Size(1080, 800));

  setUpInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
