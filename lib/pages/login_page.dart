// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:s_media_app/components/my_button.dart';
import 'package:s_media_app/components/my_textfiled.dart';
import 'package:s_media_app/helper/helper_function.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text controller
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //login to user
  void loginUser() async {
    //show loading circel
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //pop loading circel
      if (context.mounted) Navigator.pop(context);
    }
    //display any errors
    on FirebaseAuthException catch (e) {
      //pop loading cirecel
      Navigator.pop(context);
      //display error massage to user
      displayMassageToUser(e.code, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.person,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 50,
            ),
            //app name
            const Text(
              'S I M P L E',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 50,
            ),
            //email textfiled
            MyTextFiled(
              hintText: 'Email',
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            //password textfiled
            MyTextFiled(
              hintText: 'Password',
              obscureText: true,
              controller: passwordController,
            ),
            const SizedBox(
              height: 10,
            ),
            //forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //login button
            MyButton(
              text: 'Login',
              onTap: loginUser,
            ),
            const SizedBox(
              height: 20,
            ),
            //don't have a account Register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have a account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: const Text(
                    "Register Here",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
