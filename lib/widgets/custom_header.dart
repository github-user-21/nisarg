import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBackPressed;

  const CustomHeader(
      {super.key, required this.title, required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Bigger Green Circle
        Positioned(
          top: -50,  // Move up to cover more area
          left: -50, // Move left to ensure it wraps around
          child: Container(
            width: 150, // Increased size
            height: 150,
            decoration: const BoxDecoration(
              // color: Colors.green, // Circle color
              shape: BoxShape.circle,
            ),
          ),
        ),

        // Back Button & "Back" Text
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 20), // Adjust for safe area
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black,size: 20,),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 5),
              // const Text(
              //   'Back',
              //   style: TextStyle(color: Colors.black, fontSize: 16),
              // ),
            ],
          ),
        ),

        // // "Login" Title Positioned Better
        // const Positioned(
        //   top: 100, // Move down to center in the circle
        //   left: 60, // Adjust left for proper alignment
        //   child: Text(
        //     'Login',
        //     style: TextStyle(
        //       fontSize: 28,
        //       fontWeight: FontWeight.bold,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
