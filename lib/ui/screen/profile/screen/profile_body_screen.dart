import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:world_skills_project/internal/router/app_routes.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody();

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  final GlobalKey _avatarKey = GlobalKey();
  final GlobalKey _becomeLandlordKey = GlobalKey();
  final GlobalKey _logoutKey = GlobalKey();
  bool _alreadyShownTutorial = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_alreadyShownTutorial) {
        ShowCaseWidget.of(
          context,
        ).startShowCase([_avatarKey, _becomeLandlordKey, _logoutKey]);
        _alreadyShownTutorial = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Профиль',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),

              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Showcase(
                      key: _avatarKey,
                      title: 'Редактировать профиль',
                      description:
                          'Нажмите здесь, чтобы поменять фото профиля или изменить данные.',
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF7F7F7),
                          borderRadius: BorderRadius.circular(32),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context.push(AppRoutes.editProfileScreen);
                          },
                          child: Stack(
                            children: [
                              const Icon(
                                Icons.person,
                                size: 80,
                                color: Color(0xFFD9D9D9),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        color: AppColor.primaryColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.edit,
                                        size: 16,
                                        color: AppColor.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    const Text(
                      'Ескендир',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '+7 (777) 123 45 67',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF717171),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
              Showcase(
                key: _becomeLandlordKey,
                title: 'Стать арендателем',
                description:
                    'Здесь можно разместить свои апартаменты и сдавать их в аренду.',
                child: GestureDetector(
                  onTap: () {
                    context.push(AppRoutes.becomeTenant);
                  },
                  child: Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.greyLightest,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.supervised_user_circle_outlined,
                            color: AppColor.primaryColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Стать арендателем',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: AppColor.primaryColor,
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
              Divider(color: AppColor.greyLight, thickness: 1),
              const SizedBox(height: 24),

              Showcase(
                key: _logoutKey,
                title: 'Выйти из аккаунта',
                description:
                    'Нажмите, чтобы завершить сессию и вернуться на экран входа.',
                child: GestureDetector(
                  onTap: () {
                    // TODO: Реализовать логику выхода
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/ic_exit.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Выйти из аккаунта',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFF3B30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
