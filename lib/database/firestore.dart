import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/* 

This database stores posts that user have published in the app.
It is stored in collection called 'Posts' in firebase


Each post contains,
-a massage
-email of user
-timestamp

*/

class FirestoreDataBase {
  //current logged in user
  User? user = FirebaseAuth.instance.currentUser;

  //get collection of posts from firebase
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('Posts');

  //post a massage
  Future<void> addPost(String message) {
    return posts.add({
      'UserEmail': user!.email,
      'PostMessage': message,
      'TimeStamp': Timestamp.now(),
    });
  }

  //red posts from database
  Stream<QuerySnapshot> getPostStream() {
    final postStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('TimeStamp', descending: true)
        .snapshots();

    return postStream;
  }
}
