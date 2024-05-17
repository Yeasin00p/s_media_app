import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:s_media_app/components/my_back_button.dart';
import 'package:s_media_app/helper/helper_function.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: (context, snapshot) {
          //any error
          if (snapshot.hasError) {
            displayMassageToUser('Something went wrong', context);
          }
          //show loading circle
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null) {
            return const Text('No Data');
          }
          //get all users
          final users = snapshot.data!.docs;
          return Column(
            children: [
              //back button
              const Padding(
                padding: EdgeInsets.only(
                  left: 25,
                  top: 50,
                ),
                child: Row(
                  children: [
                    MyBackButton(),
                  ],
                ),
              ),
              //list of user in the app
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    //get individual user
                    final user = users[index];
                    return ListTile(
                      title: Text(
                        user['username'],
                      ),
                      subtitle: Text(
                        user['email'],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
