import 'package:flutter/material.dart';
import 'package:s_media_app/components/my_button.dart';
import 'package:s_media_app/components/my_textfiled.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  RegisterPage({super.key});

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

            //user name textfiled
            MyTextFiled(
              hintText: 'User Name',
              obscureText: false,
              controller: emailController,
            ),
            const SizedBox(
              height: 10,
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
            //confirm password textfiled
            MyTextFiled(
              hintText: 'Confirm Password',
              obscureText: true,
              controller: passwordController,
            ),

            const SizedBox(
              height: 20,
            ),
            //login button
            MyButton(
              text: 'Register',
              onTap: () {},
            ),
            const SizedBox(
              height: 20,
            ),
            //don't have a account Register here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "All ready have a account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Login Here",
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
