import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key:key);

  static const String _title = "Flutter Training";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget{
  const MyStatelessWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Tutorial'),
      ),
      body: const Center(
        child: Text('data',
        style:TextStyle(fontSize: 48)
      ),
    ));
  }
}
