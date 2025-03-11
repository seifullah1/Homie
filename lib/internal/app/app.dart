import 'package:flutter/material.dart';
import 'package:world_skills_project/internal/router/app_router.dart';
import 'package:world_skills_project/ui/screen/onboarding/onboarding_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      // routerDelegate: ,
    );
  }
}
