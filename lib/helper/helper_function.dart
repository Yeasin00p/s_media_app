import 'package:flutter/material.dart';

void displayMassageToUser(String text, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(text),
    ),
  );
}
