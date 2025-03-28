import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:world_skills_project/internal/router/app_routes.dart';
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
  late String _filePath;

  Future<void> _initFile() async {
    final dir = await getTemporaryDirectory();
    _filePath = p.join(dir.path, 'users.json');

    final file = File(_filePath);
    if (!(await file.exists())) {
      await file.writeAsString(jsonEncode([]));
    }
  }

  Future<bool> _authenticateUser(String phone) async {
    await _initFile();
    final file = File(_filePath);
    final contents = await file.readAsString();
    final List<dynamic> users = jsonDecode(contents);
    return users.any((user) => user['phone'] == phone);
  }

  @override
  void initState() {
    super.initState();
    _initFile();
    _phoneController.addListener(() {
      setState(() {
        _isValid = _phoneController.text.isNotEmpty;
      });
    });
  }

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
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            const Text(
              'Вход и Регистрация',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Введите номер телефона для входа в приложение',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 24),
            AppTextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              hintText: '+7 (___) ___-__-__',
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 56),
              child: AppButton(
                backgroundColor:
                    _isValid ? AppColor.primaryColor : Colors.grey.shade300,
                text: 'Войти',
                onPressed:
                    _isValid
                        ? () {
                          _authenticateUser(_phoneController.text).then((
                            isAuthenticated,
                          ) {
                            if (isAuthenticated) {
                              context.push(AppRoutes.home);
                            } else {
                              context.push(AppRoutes.registerScreen);
                            }
                          });
                        }
                        : () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
