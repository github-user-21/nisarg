import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/challenges_screen.dart';
import 'screens/learn_screen.dart';
import 'screens/community_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nisarg',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/welcome', // Set the starting screen
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/home': (context) => const HomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignupScreen(),
        '/challenges': (context) => ChallengesScreen(),
        '/learn': (context) => const LearnScreen(),
        '/community': (context) => CommunityScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
