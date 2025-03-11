import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:world_skills_project/ui/screen/my_book/widget/my_book_body.dart';
import 'package:world_skills_project/ui/screen/my_book/widget/tab_bar_widget.dart';
import 'package:world_skills_project/ui/widgets/app_button/app_button.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';

class MyBook extends StatelessWidget {
  const MyBook({super.key});

  @override
  Widget build(BuildContext context) {
    return ShowCaseWidget(
      // autoPlay: true,
      // autoPlayDelay: Duration(seconds: 3),
      builder: (context) {
        return const MyBookBody();
      },
    );
  }
}
