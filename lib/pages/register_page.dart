// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:s_media_app/components/my_button.dart';
import 'package:s_media_app/components/my_textfiled.dart';
import 'package:s_media_app/helper/helper_function.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //text controller
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // register method
  void registerUser() async {
    //show loading circel
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    //make sure password match
    if (passwordController.text != confirmPasswordController.text) {
      //pop loading circel
      Navigator.pop(context);
      //show error massage to user
      displayMassageToUser("Password don't match", context);
    }
    //if password do match
    else {
      //try creating the uaer
      try {
        //create the user
        UserCredential? userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        //creating a user document and add to firestore
        createUserDocument(userCredential);
        //pop loading circel
        if (context.mounted) {
          Navigator.pop(context);
        }
        // ignore: curly_braces_in_flow_control_structures
      } on FirebaseAuthException catch (e) {
        //pop loading circel
        Navigator.pop(context);
        //show error massage to user

        displayMassageToUser(e.code, context);
      }
    }
  }

  //crate user document and collect them in firestore
  Future<void> createUserDocument(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': userNameController.text,
      });
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

            //user name textfiled
            MyTextFiled(
              hintText: 'User Name',
              obscureText: false,
              controller: userNameController,
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
              controller: confirmPasswordController,
            ),

            const SizedBox(
              height: 20,
            ),
            //login button
            MyButton(
              text: 'Register',
              onTap: registerUser,
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
