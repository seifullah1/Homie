import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:world_skills_project/ui/screen/my_book/widget/tab_bar_widget.dart';
import 'package:world_skills_project/ui/widgets/app_button/app_button.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';

class MyBookBody extends StatefulWidget {
  const MyBookBody({super.key});

  @override
  State<MyBookBody> createState() => _MyBookBodyState();
}

class _MyBookBodyState extends State<MyBookBody> {
  int selectedIndex = 0;

  final GlobalKey _tabBarKey = GlobalKey();
  final GlobalKey _bodyKey = GlobalKey();
  final GlobalKey _searchButtonKey = GlobalKey();

  bool _alreadyShownTutorial = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_alreadyShownTutorial) {
        ShowCaseWidget.of(
          context,
        ).startShowCase([_tabBarKey, _bodyKey, _searchButtonKey]);
        _alreadyShownTutorial = true;
      }
    });
  }

  void _handleTabTap(int index) {
    setState(() => selectedIndex = index);
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
                'Мои брони',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Showcase(
                key: _tabBarKey,
                title: 'Вкладки',
                description: 'Здесь переключение между «Активные» и «История».',
                child: TabBarWidget(
                  selectedIndex: selectedIndex,
                  onTabTap: _handleTabTap,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    _ActiveBookings(
                      bodyKey: _bodyKey,
                      searchButtonKey: _searchButtonKey,
                    ),
                    const _HistoryBookings(),
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

class _ActiveBookings extends StatelessWidget {
  final GlobalKey bodyKey;
  final GlobalKey searchButtonKey;

  const _ActiveBookings({required this.bodyKey, required this.searchButtonKey});

  @override
  Widget build(BuildContext context) {
    return Showcase(
      key: bodyKey,
      title: 'Активные брони',
      description: 'Здесь будут все ваши текущие/не завершённые бронирования.',
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 77),
            Image.asset('assets/images/active.png'),
            const SizedBox(height: 24),
            const Text(
              'У вас нет активных бронирований',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Забронируйте для себя апартамент из\nсписка в разделе “Главное”',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF717171),
              ),
            ),
            const SizedBox(height: 24),
            Showcase(
              key: searchButtonKey,
              title: 'Кнопка поиска',
              description:
                  'Нажмите здесь, чтобы выбрать подходящий апартамент.',
              child: AppButton(
                onPressed: () {},
                text: 'Начать поиск',
                backgroundColor: AppColor.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HistoryBookings extends StatelessWidget {
  const _HistoryBookings();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'История бронирований',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    );
  }
}
