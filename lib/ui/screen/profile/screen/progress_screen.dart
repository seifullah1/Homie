import 'package:flutter/material.dart';
import 'dart:async';

import 'package:world_skills_project/ui/widgets/app_button/app_button.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';

class ProgressScreen extends StatefulWidget {
  @override
  _ProgressScreenState createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen>
    with TickerProviderStateMixin {
  late AnimationController _progressController;
  late Animation<double> _progressAnimation;
  late AnimationController _checkmarkController;
  late Animation<double> _checkmarkScaleAnimation;
  late AnimationController _errorController;
  late Animation<double> _errorShakeAnimation;
  bool isCompleted = false;
  bool isFailed = false;

  @override
  void initState() {
    super.initState();
    _progressController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _progressController, curve: Curves.easeOutCubic),
    );

    _checkmarkController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _checkmarkScaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _checkmarkController, curve: Curves.elasticOut),
    );

    _errorController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _errorShakeAnimation = Tween<double>(begin: -10, end: 10).animate(
      CurvedAnimation(parent: _errorController, curve: Curves.elasticIn),
    );

    _progressController.forward();
    _progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        bool success = DateTime.now().second % 2 == 0;
        if (success) {
          setState(() => isCompleted = true);
          _checkmarkController.forward();
        } else {
          setState(() => isFailed = true);
          _errorController.repeat(reverse: true);
        }
      }
    });
  }

  @override
  void dispose() {
    _progressController.dispose();
    _checkmarkController.dispose();
    _errorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _progressController,
          builder: (context, child) {
            if (isCompleted) {
              return _buildSuccessView();
            } else if (isFailed) {
              return _buildErrorView();
            } else {
              return _buildLoadingView(_progressAnimation.value);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadingView(double progress) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                value: progress,
                strokeWidth: 8,
                backgroundColor: Colors.grey.shade300,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppColor.primaryColor,
                ),
              ),
            ),
            Text(
              "${(progress * 100).toInt()}%",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColor.primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        Text(
          "Переносим ваши объявления...",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Text(
          "Пожалуйста, подождите",
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildSuccessView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _checkmarkScaleAnimation,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF4CAF50),
              ),
              child: Icon(Icons.check, size: 80, color: Colors.white),
            ),
          ),
          SizedBox(height: 24),
          Text(
            "Объявления добавлены",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "Чтобы посмотреть ваши объявления перейдите в раздел \"Мои объявления\"",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 32),
          AppButton(
            backgroundColor: AppColor.primaryColor,
            text: 'В главную',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildErrorView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _errorController,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(_errorShakeAnimation.value, 0),
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Icon(Icons.close, size: 80, color: Colors.white),
              ),
            );
          },
        ),
        SizedBox(height: 24),
        Text(
          "Ошибка при переносе объявлений",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.red,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Попробуйте еще раз позже",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: ProgressScreen()),
  );
}
