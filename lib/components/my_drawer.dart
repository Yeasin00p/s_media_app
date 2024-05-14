import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  //logout user
  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //drawer header
          DrawerHeader(
            child: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Column(
            children: [
              //home tittle
              HomeListTile(
                iconData: Icons.home,
                text: 'H O M E',
                onTap: () {
                  //this is allready home screen so just pop drawer
                  Navigator.pop(context);
                },
              ),
              //profile tittle
              HomeListTile(
                iconData: Icons.person,
                text: 'P R O F I L E',
                onTap: () {
                  //pop drawer
                  Navigator.pop(context);
                  //navigate to profile page
                  Navigator.pushNamed(context, '/profile_page');
                },
              ),
              //user tittle
              HomeListTile(
                iconData: Icons.group,
                text: 'U S E R S',
                onTap: () {
                  //pop drawer
                  Navigator.pop(context);
                  //navigate to user page
                  Navigator.pushNamed(context, '/users_page');
                },
              ),
            ],
          ),
          HomeListTile(
            iconData: Icons.logout,
            text: 'L O G O U T ',
            onTap: logout,
          ),
        ],
      ),
    );
  }
}

class HomeListTile extends StatelessWidget {
  final IconData iconData;
  final String text;
  final void Function()? onTap;
  const HomeListTile({
    super.key,
    required this.iconData,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ListTile(
        leading: Icon(
          iconData,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
