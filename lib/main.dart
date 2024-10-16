import 'package:flutter/material.dart';
import 'package:swd_project/pages/auth/login_page.dart';
import 'package:swd_project/utils/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoginPage(),
      
    );
  }
}
