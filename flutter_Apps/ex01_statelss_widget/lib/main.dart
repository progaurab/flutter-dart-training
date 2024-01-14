import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Stateless Widget Flutter Demo',
      home: GreetingScreen(),
    );
  }
}

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome!'),
      ),
      body: const Center(
        child: Text(
          'Instill Learning',
          style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold ),
        ),
      ),
    );
  }
}

