import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:world_skills_project/ui/screen/auth/register/register_screen.dart';
import 'package:world_skills_project/ui/widgets/app_button/app_button.dart';
import 'package:world_skills_project/ui/widgets/app_color/app_colors.dart';
import 'package:world_skills_project/ui/widgets/app_text_field/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32),
            Text(
              'Вход и Регистрация',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Введите номер телефона для получения\nSMS-кода и доступа в приложение',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.green2,
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Номер телефона',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: _isValid ? Colors.black : Colors.red,
              ),
            ),
            SizedBox(height: 8),

            AppTextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              hintText: '+7 (___) ___-__-__',
              // prefixIcon: Icon(Icons.phone, color: Colors.grey),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Не правильный формат';
                }
                // bool isValid = isPhoneValid(value);

                return null;
              },
              onChanged: (value) {
                setState(() {
                  // _isValid = value.length;
                });
              },
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 56),
              child: AppButton(
                backgroundColor:
                    _isValid ? AppColor.primaryColor : Colors.grey.shade300,
                text: 'Войти',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
