import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'challenge_progress.dart';
import 'home_screen.dart';

class ChallengeDetailScreen extends StatelessWidget {
  final Map<String, dynamic> challenge;

  const ChallengeDetailScreen({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        shadowColor: Colors.grey.shade300,
        title: const Text(
          "Challenge Details",
          style: TextStyle(
            fontFamily: 'NunitoSans',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Section: Started Challenges Avatars
            const Text(
              "Your Started Challenges",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: List.generate(4, (index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    radius: 18,
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            // 🔹 Section: Challenge Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                challenge['imageUrl'],
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 15),

            // 🔹 Section: Challenge Title
            Text(
              challenge['title'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 5),

            // 🔹 Section: Tags
            Text(
              "#GoGreen, #${challenge['title'].replaceAll(' ', '')}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),

            NeumorphicButton(
              onPressed: () {
                // ✅ Show confirmation popup
                showDialog(
                  context: context,
                  builder: (context) =>
                      AlertDialog(
                        title: const Text("Start Challenge"),
                        content: const Text(
                            "Are you sure you want to start this challenge?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              Fluttertoast.showToast(
                                  msg: "Challenge Started! 🎉");

                              // ✅ Navigate to Challenge Progress Screen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChallengeProgressScreen(
                                        challenge: challenge,
                                      ),
                                ),
                              );
                            },
                            child: const Text("Start"),
                          ),
                        ],
                      ),
                );
              },
              style: NeumorphicStyle(
                color: Colors.green.shade400,
                depth: 2,
                boxShape: NeumorphicBoxShape.roundRect(
                    BorderRadius.circular(30)),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Text(
                  "Start Challenge",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // 🔹 Section: Actions (Save, Share)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NeumorphicButton(
                  onPressed: () {
                    // Save action
                  },
                  style: const NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.circle(),
                    depth: 2,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.bookmark_outline, size: 20),
                ),
                const SizedBox(width: 10),
                NeumorphicButton(
                  onPressed: () {
                    // Share action
                  },
                  style: const NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.circle(),
                    depth: 2,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: const Icon(Icons.share, size: 20),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // 🔹 Section: Rules
            const Text(
              "Rules",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRuleItem("Reduce",
                    "Cut down on single-use items like plastic bags, bottles, and packaging."),
                _buildRuleItem("Reuse",
                    "Opt for reusable items, such as containers, bags, and bottles."),
                _buildRuleItem("Recycle",
                    "Properly sort and recycle materials when necessary."),
                _buildRuleItem("Refuse",
                    "Say no to items you don’t need, especially disposables."),
              ],
            ),
            const SizedBox(height: 20),

            // 🔹 Section: Followers
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Followed by ",
                    style: TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                  TextSpan(
                    text: "Om, Aditya, 250000 more",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // ✅ Widget to create a rule item
  Widget _buildRuleItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 8, color: Colors.black87),
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
