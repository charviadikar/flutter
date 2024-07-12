// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_1/get_started.dart';
import 'package:flutter_application_1/payment1.dart';
import 'package:flutter_application_1/review_screen.dart'; // Ensure this path is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Homely',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReviewScreen(), // Remove const
    );
  }
}
