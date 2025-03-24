import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_skills_project/internal/router/app_routes.dart';
import 'package:world_skills_project/ui/screen/apartament/apartament_details_screen.dart';
import 'package:world_skills_project/ui/screen/auth/login/login_screen.dart';
import 'package:world_skills_project/ui/screen/auth/register/register_screen.dart';
import 'package:world_skills_project/ui/screen/favorite/favorite_screen.dart';
import 'package:world_skills_project/ui/screen/home/home_screen.dart';
import 'package:world_skills_project/ui/screen/my_book/my_book.dart';
import 'package:world_skills_project/ui/screen/onboarding/onboarding_screen.dart';
import 'package:world_skills_project/ui/screen/profile/profile_screen.dart';
import 'package:world_skills_project/ui/screen/profile/screen/become_tanant.dart';
import 'package:world_skills_project/ui/screen/profile/screen/create_apartament_screen.dart';
import 'package:world_skills_project/ui/screen/profile/screen/edit_profile_screen.dart';
import 'package:world_skills_project/ui/screen/profile/screen/progress_screen.dart';
import 'package:world_skills_project/ui/widgets/bottom_bar/bottom_bar.dart';

class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.onboardingScreen,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.onboardingScreen,
        builder: (context, state) => OnboardingScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) {
          return BottomBarScreen(child: child, path: state.fullPath);
        },
        routes: [
          GoRoute(
            path: AppRoutes.home,
            builder: (context, state) => HomeScreen(),
          ),
          GoRoute(
            path: AppRoutes.myBookScreen,
            builder: (context, state) => MyBook(),
          ),
          GoRoute(
            path: AppRoutes.favoriteScreen,
            builder: (context, state) => FavoriteScreen(),
          ),
          GoRoute(
            path: AppRoutes.profileScreen,
            builder: (context, state) => ProfileScreen(),
          ),
        ],
      ),

      GoRoute(
        path: AppRoutes.registerScreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.editProfileScreen,
        builder: (context, state) => EditProfileScreen(),
      ),
      GoRoute(
        path: AppRoutes.editProfileScreen,
        builder: (context, state) => ApartamentDetailsScreen(),
      ),
      GoRoute(
        path: AppRoutes.becomeTenant,
        builder: (context, state) => BecomeTanant(),
      ),
      GoRoute(
        path: AppRoutes.createApartamentScreen,
        builder: (context, state) => CreateApartamentScreen(),
      ),
      GoRoute(
        path: AppRoutes.progressScreen,
        builder: (context, state) => ProgressScreen(),
      ),
    ],
  );
}
