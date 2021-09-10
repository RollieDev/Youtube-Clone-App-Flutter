import 'package:flutter/material.dart';
import 'package:youtube_clone_app/screens/home_screen.dart';

void main() {
  runApp(
    const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

 //
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
      );
  }
}

