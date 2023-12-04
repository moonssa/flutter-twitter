import 'package:flutter/material.dart';
import 'package:twitter/features/authentication/initial_screen.dart';
// import 'package:twitter/features/authentication/password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Twitter',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFF4E98E9),
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: Theme.of(context).primaryColor,
            // size: Sizes.size48,
          ),
        ),
        useMaterial3: true,
      ),
      // home: const PasswordScreen(),
      home: const InitialScreen(),
    );
  }
}
