import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Spacer(),
          Image.asset('assets/images/img.png', height: 100),
          const Text(
            'Nisarg',
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.bold, color: Colors.green,fontFamily: 'NunitoSans'),
          ),
          const Text(
            'Naturally social',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const Spacer(),
          Container(
            height: 260,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF122C38), // This is correct
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 60,width: double.maxFinite,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,

                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const LoginScreen())),
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white70, fontSize: 20,fontFamily: 'NunitoSans'),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,

                    minimumSize: const Size(200, 50),
                  ),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SignupScreen())),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white70,fontSize: 20,fontFamily: 'NunitoSans'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
