import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import 'challenges_screen.dart';



class ChallengeProgressScreen extends StatelessWidget {
  final Map<String, dynamic> challenge;

  const ChallengeProgressScreen({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ AppBar with Back Button to Home
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        shadowColor: Colors.grey.shade300,
        title: Text(
          challenge['title'],
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ChallengesScreen()),
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Challenge Image
            CircleAvatar(
              radius: 70,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: NetworkImage(challenge['imageUrl']),
            ),
            const SizedBox(height: 10),

            // 🔹 Challenge Hashtags
            Text(
              "#GoGreen, #${challenge['title'].replaceAll(' ', '')}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),

            // 🔹 Share Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              icon: const Icon(Icons.share, color: Colors.white),
              label: const Text(
                "Share Post",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Fluttertoast.showToast(msg: "Shared Successfully!");
              },
            ),
            const SizedBox(height: 20),

            // 🔹 Daily Progress Tracking Input
            Neumorphic(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              style: NeumorphicStyle(
                depth: -3,
                intensity: 0.8,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Track and write what you did today",
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(height: 25),

            // 🔹 Streak Tracker
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Streak",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Column(
                  children: [
                    const Icon(
                      Icons.calendar_today, // Built-in calendar icon
                      size: 40,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Day ${index + 1}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              }),
            ),

            const SizedBox(height: 20),

            // 🔹 FAQ / Rules Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "How to complete the challenge?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            _buildRuleItem("Complete Daily Tasks", "Update your progress daily by logging activities."),
            _buildRuleItem("Stay Consistent", "Keep a streak going for better rewards."),
            _buildRuleItem("Share and Inspire", "Post your progress to motivate others."),
            _buildRuleItem("Follow the Rules", "Ensure activities align with the challenge theme."),
            const SizedBox(height: 20),

            // 🔹 Rewards Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Earn Rewards & Badges",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            _buildRuleItem("Completion Reward", "Successfully completing the challenge earns you a badge."),
            _buildRuleItem("Community Recognition", "Top performers get featured in our app."),
            _buildRuleItem("EcoHub Points", "Earn points to redeem in future events."),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ✅ Helper method to build rules
  Widget _buildRuleItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$title: ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
