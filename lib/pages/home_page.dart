import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:s_media_app/components/my_drawer.dart';
import 'package:s_media_app/components/my_post_button.dart';
import 'package:s_media_app/components/my_textfiled.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController newPostTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S I M P L E'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const MyDrawer(),
      body: Column(
        children: [
          //textfiled box for user to type
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              children: [
                //textfiled
                Expanded(
                  child: MyTextFiled(
                    hintText: 'Say somethis ...',
                    obscureText: false,
                    controller: newPostTextController,
                  ),
                ),
                //post button
                PostButton(
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
