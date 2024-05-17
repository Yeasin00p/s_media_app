import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String title;
  final String subbtitle;
  const MyListTile({super.key, required this.title, required this.subbtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        bottom: 10,
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(
          subbtitle,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
