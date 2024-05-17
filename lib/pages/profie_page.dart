import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:s_media_app/components/my_back_button.dart';

class ProiFilePage extends StatelessWidget {
  ProiFilePage({super.key});
  //current  logged in user
  final User? currentUser = FirebaseAuth.instance.currentUser;
  //future tp fetch user document
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProFile Page'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder(
        future: getUserDetails(),
        builder: (context, snapshot) {
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          //error
          else if (snapshot.hasError) {
            return Text(
              'Error:${snapshot.error}',
            );
          }
          //data recive
          else if (snapshot.hasData) {
            //extrect data
            Map<String, dynamic>? user = snapshot.data!.data();
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
                //profile pic
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: const Icon(
                    Icons.person,
                    size: 64,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //username
                Text(
                  user!['username'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //email
                Text(
                  user['email'],
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            );
          } else {
            return const Text('No Data');
          }
        },
      ),
    );
  }
}
