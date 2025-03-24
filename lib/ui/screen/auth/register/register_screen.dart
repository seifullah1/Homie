import 'dart:convert';
import 'dart:io';
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
  final TextEditingController _phoneController = TextEditingController();
  bool _isValid = false;

  Future<void> _checkUsersFile() async {
    final file = File('assets/jsons/users.json');
    if (!(await file.exists())) {
      await file.create(recursive: true);
      await file.writeAsString(jsonEncode([]));
    }
  }

  Future<void> _registerUser(String name, String phone) async {
    await _checkUsersFile();
    final file = File('assets/jsons/users.json');
    final contents = await file.readAsString();
    final List<dynamic> users = jsonDecode(contents);

    if (users.any((user) => user['phone'] == phone)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Этот номер уже зарегистрирован!')),
      );
      return;
    }

    users.add({'name': name, 'phone': phone});
    await file.writeAsString(jsonEncode(users));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_validateInput);
    _phoneController.addListener(_validateInput);
  }

  void _validateInput() {
    setState(() {
      _isValid =
          _nameController.text.isNotEmpty && _phoneController.text.isNotEmpty;
    });
  }

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
              const Text(
                'Заполните свои данные',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Чтобы получить доступ к сервису, введите свои данные',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              AppTextField(
                controller: _nameController,
                hintText: 'Имя',
                keyboardType: TextInputType.text,
              ),
              AppTextField(
                controller: _phoneController,
                hintText: 'Телефон',
                keyboardType: TextInputType.phone,
              ),
              const Spacer(),
              AppButton(
                text: 'Зарегистрироваться',
                onPressed: () {
                  if (_isValid) {
                    _registerUser(_nameController.text, _phoneController.text);
                  }
                },
                backgroundColor:
                    _isValid ? AppColor.primaryColor : Colors.grey.shade300,
              ),
              const SizedBox(height: 16),
              const Text(
                'Регистрируясь, вы принимаете условия',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
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
