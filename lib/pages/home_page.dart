import 'package:flutter/material.dart';
import 'package:s_media_app/components/my_drawer.dart';
import 'package:s_media_app/components/my_list_tile.dart';
import 'package:s_media_app/components/my_post_button.dart';
import 'package:s_media_app/components/my_textfiled.dart';
import 'package:s_media_app/database/firestore.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  //firestore access
  final FirestoreDataBase dataBase = FirestoreDataBase();
  //text editing controller
  final TextEditingController newPostTextController = TextEditingController();
  //post message
  void postMessage() {
    //only post message if there is something in the textfiled
    if (newPostTextController.text.isNotEmpty) {
      String message = newPostTextController.text;
      dataBase.addPost(message);

      //clear the controller
      newPostTextController.clear();
    }
  }

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
                  onTap: postMessage,
                ),
              ],
            ),
          ),
          //read post
          StreamBuilder(
            stream: dataBase.getPostStream(),
            builder: (context, snapshot) {
              //show loading circle
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              //get all post
              final posts = snapshot.data!.docs;

              //no data ?
              if (snapshot.data == null || posts.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Center(
                      child: Text("No Posts...Post Something.!"),
                    ),
                  ),
                );
              }

              //return as a list
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    //get each individual post
                    final post = posts[index];

                    //get data from each posts
                    String message = post['PostMessage'];
                    String userEmail = post['UserEmail'];

                    //return as a list tile
                    return MyListTile(
                      title: message,
                      subbtitle: userEmail,
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
