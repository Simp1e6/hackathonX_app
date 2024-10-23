import 'package:flutter/material.dart';
import 'package:hackathonX_app/home.dart';
import 'register.dart'; // Import your register page
import 'login.dart'; // Import login page
import 'forget_password.dart'; // Import forget password page file

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 215, 179, 102)),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Start with the login page
      routes: {
        '/login': (context) => const LoginPage(), // Login Page
        '/register': (context) => const RegisterPage(), // Register Page
        '/forget_password': (context) => const ForgetPasswordPage(), // Forget Password Page
        '/home': (context) => const MyHomePage(), // Home Page after login
      },
      debugShowCheckedModeBanner: false,
    );
  }
}