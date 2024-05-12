import 'package:flutter/material.dart';
import 'package:s_media_app/auth/login_or_register.dart';
import 'package:s_media_app/theme/dark_mode.dart';
import 'package:s_media_app/theme/light_mode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'S Media',
      theme: lightMode,
      darkTheme: darkMode,
      home:  const LoginOrRegister()
    );
  }
}
