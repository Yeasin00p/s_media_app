import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:s_media_app/auth/auth_page.dart';
import 'package:s_media_app/auth/login_or_register.dart';
import 'package:s_media_app/firebase_options.dart';
import 'package:s_media_app/pages/home_page.dart';
import 'package:s_media_app/pages/profie_page.dart';
import 'package:s_media_app/pages/user_page.dart';
import 'package:s_media_app/theme/dark_mode.dart';
import 'package:s_media_app/theme/light_mode.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      home: const AuthPage(),
      routes: {
        '/login_registr_page': (context) => const LoginOrRegister(),
        '/home_page': (context) => HomePage(),
        '/profile_page': (context) => ProiFilePage(),
        '/users_page': (context) => const UserPage(),
      },
    );
  }
}
