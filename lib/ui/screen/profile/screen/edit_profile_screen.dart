import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:world_skills_project/ui/widgets/app_button/app_button.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';
import 'package:world_skills_project/ui/widgets/app_text_field/app_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        title: Text(
          'Настройки профиля',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColor.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  SizedBox(height: 16),

                  // SizedBox(height: 8),
                ],
              ),
              AppTextField(
                controller: _nameController,
                hintText: 'Имя',
                keyboardType: TextInputType.text,
              ),
              Spacer(),
              AppButton(
                text: 'Сохранить',
                onPressed: () {
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => HomeScreen()),
                  // );
                },
                backgroundColor: AppColor.primaryColor,
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'Отмена',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primaryColor,
                    ),
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
