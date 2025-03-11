import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:world_skills_project/internal/router/app_routes.dart';
import 'package:world_skills_project/ui/screen/profile/screen/profile_body_screen.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      builder: (context) {
        return const ProfileBody();
      },
    );
  }
}
