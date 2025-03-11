import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:world_skills_project/internal/router/app_routes.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key, required this.child, this.path});

  final String? path;
  final Widget child;

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;

  void setIndex() {
    switch (widget.path) {
      case AppRoutes.home:
        currentIndex = 0;
        break;
      case AppRoutes.myBookScreen:
        currentIndex = 1;
        break;
      case AppRoutes.favoriteScreen:
        currentIndex = 2;
        break;
      case AppRoutes.profileScreen:
        currentIndex = 3;
        break;
      default:
        currentIndex = 0;
        break;
    }
  }

  @override
  void didUpdateWidget(covariant BottomBarScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.path != widget.path) {
      setIndex();
    }
  }

  @override
  Widget build(BuildContext context) {
    setIndex();

    final List<BottomNavigationBarItem> bottomBarItems = [
      BottomNavigationBarItem(
        icon: SvgPicture.asset(
          'assets/icons/ic_home.svg',
          width: 20,
          height: 20,
          color: AppColor.greyDark,
        ),
        activeIcon: SvgPicture.asset(
          'assets/icons/ic_home.svg',
          width: 20,
          height: 20,
        ),
        label: 'Главная',
      ),

      BottomNavigationBarItem(
        icon: Icon(
          Icons.calendar_today_outlined,
          color: AppColor.greyDark,
          size: 20,
        ),
        activeIcon: Icon(
          Icons.calendar_today_outlined,
          size: 20,
          color: AppColor.primaryColor,
        ),
        label: 'Мои брони',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outline, color: AppColor.greyDark, size: 20),
        activeIcon: Icon(
          Icons.favorite_outline,
          color: AppColor.primaryColor,
          size: 20,
        ),
        label: 'Избранные',
      ),

      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline, color: AppColor.greyDark, size: 20),
        activeIcon: Icon(
          Icons.person_outline,
          color: AppColor.primaryColor,
          size: 20,
        ),
        label: 'Профиль',
      ),
    ];

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashFactory: Platform.isIOS ? NoSplash.splashFactory : null,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          backgroundColor: AppColor.white,
          currentIndex: currentIndex,
          selectedItemColor: AppColor.primaryColor,
          unselectedItemColor: AppColor.greyDark,
          unselectedLabelStyle: const TextStyle(color: AppColor.black),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: onItemTap,
          items: bottomBarItems,
        ),
      ),
    );
  }

  void onItemTap(int index) {
    setState(() => currentIndex = index);

    switch (index) {
      case 0:
        GoRouter.of(context).go(AppRoutes.home);
        break;
      case 1:
        GoRouter.of(context).go(AppRoutes.myBookScreen);
        break;
      case 2:
        GoRouter.of(context).go(AppRoutes.favoriteScreen);
        break;
      case 3:
        GoRouter.of(context).go(AppRoutes.profileScreen);
        break;
    }
  }
}
