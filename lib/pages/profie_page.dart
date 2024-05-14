import 'package:flutter/material.dart';

class ProiFilePage extends StatelessWidget {
  const ProiFilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProFile Page'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
