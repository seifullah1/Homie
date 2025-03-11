import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_skills_project/internal/router/app_routes.dart';
import 'package:world_skills_project/ui/widgets/app_button/app_button.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';
import 'package:world_skills_project/ui/widgets/app_text_field/app_text_field.dart';

class BecomeTanant extends StatefulWidget {
  const BecomeTanant({super.key});

  @override
  State<BecomeTanant> createState() => _BecomeTanantState();
}

class _BecomeTanantState extends State<BecomeTanant> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _countController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        backgroundColor: AppColor.white,
        title: Text(
          'Стать арендодателем',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
                'Чтобы получить доступ к сдаче в аренду квартир,\nпредоставьте следующие данные',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColor.green2,
                ),
              ),
              SizedBox(height: 24),
              AppTextField(
                controller: _nameController,
                hintText: 'Название',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),

              AppTextField(
                controller: _nameController,
                hintText: 'Город',
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16),

              AppTextField(
                controller: _nameController,
                hintText: 'Количество апартаментов',
                keyboardType: TextInputType.text,
              ),
              Spacer(),
              AppButton(
                text: 'Начать',
                onPressed: () {
                  context.push(AppRoutes.createApartamentScreen);
                },
                backgroundColor: AppColor.primaryColor,
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
