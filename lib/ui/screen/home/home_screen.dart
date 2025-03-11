import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:world_skills_project/ui/screen/apartament/widget/apartement_widget.dart';
import 'package:world_skills_project/ui/screen/home/widget/header_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  bool isCollapsed = false;
  double scrollThreshold = 150;

  @override
  void initState() {  
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final pixels = _scrollController.offset;
    final direction = _scrollController.position.userScrollDirection;

    if (direction == ScrollDirection.reverse && pixels >= scrollThreshold) {
      if (!isCollapsed) {
        setState(() => isCollapsed = true);
      }
    } else if (direction == ScrollDirection.forward &&
        pixels <= scrollThreshold - 20) {
      if (isCollapsed) {
        setState(() => isCollapsed = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/home.png'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: HeaderHome(isCollapsed: isCollapsed),
            ),
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 21,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          'Апартаменты с идеей',
                          style: TextStyle(
                            color: Color(0xFF191B1D),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }
                    return const ApartementWidget();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
