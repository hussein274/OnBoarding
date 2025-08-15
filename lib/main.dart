import 'package:assignment/ui/screens/google_login/google_login.dart';
import 'package:assignment/ui/screens/register/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
        home: GoogleLogin());
  }
}
