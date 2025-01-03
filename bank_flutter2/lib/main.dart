import 'package:bank2/screens/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Management System',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // initialRoute: '/login',
      // routes: {
      //   '/login': (context) => LoginScreen(),
      //   '/register': (context) => RegisterScreen(), // Add registration route
      // '/dashboard': (context) => DashboardScreen(),
      // },
    );
  }
}

