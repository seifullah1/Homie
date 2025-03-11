import 'package:flutter/material.dart';
import 'package:world_skills_project/ui/screen/home/home_screen.dart';
import 'package:world_skills_project/ui/widgets/app_button/app_button.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';
import 'package:world_skills_project/ui/widgets/app_text_field/app_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();
  final isValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Заполните свои данные ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Чтобы получить доступ к арендам квартир,\nпредоставьте следующие данные',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.green2,
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 104,
                      width: 104,
                      decoration: BoxDecoration(
                        color: AppColor.greyLight,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Icon(
                        Icons.camera_alt,
                        size: 40,
                        color: AppColor.greyDark,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Фотография профиля',
                    style: TextStyle(
                      color: AppColor.greyDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              AppTextField(
                controller: _nameController,
                hintText: 'Имя',
                keyboardType: TextInputType.text,
              ),
              Spacer(),
              AppButton(
                text: 'Зарегистрироваться',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                backgroundColor:
                    isValid ? AppColor.grey : AppColor.primaryColor,
              ),
              SizedBox(height: 16),
              Text(
                'Регистрируясь, вы принимаете условия',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),

              // alignment: Alignment.center,
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Пользовательского соглашения и ',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'Политики конфиденциальности',
                      style: TextStyle(
                        color: AppColor.primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
