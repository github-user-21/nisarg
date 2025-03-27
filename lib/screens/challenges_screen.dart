import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'challenge_detail.dart';
import 'home_screen.dart';

class ChallengesScreen extends StatelessWidget {
  ChallengesScreen({super.key});

  // Dummy Data
  final List<Map<String, String>> ongoingChallenges = [
    {
      'imageUrl': 'https://picsum.photos/400/250?random=1',
      'title': 'Plastic Free Challenge',
      'description': 'Reduce plastic usage in your daily life.',
    },
    {
      'imageUrl': 'https://picsum.photos/400/250?random=2',
      'title': 'Energy Saving',
      'description': 'Conserve energy and reduce bills.',
    },
    {
      'imageUrl': 'https://picsum.photos/400/250?random=3',
      'title': 'Green Commute',
      'description': 'Use eco-friendly transportation options.',
    },
  ];

  final List<Map<String, String>> upcomingChallenges = [
    {
      'imageUrl': 'https://picsum.photos/400/250?random=4',
      'title': 'Zero-Waste Week',
      'description': 'Join us in reducing waste for a week!',
    },
    {
      'imageUrl': 'https://picsum.photos/400/250?random=5',
      'title': 'Meatless Monday',
      'description': 'Try a plant-based meal every Monday.',
    },
  ];

  final List<Map<String, String>> events = [
    {
      'imageUrl': 'https://picsum.photos/400/250?random=7',
      'title': 'Climate Webinar',
      'description': 'Join our webinar on climate change solutions.',
    },
    {
      'imageUrl': 'https://picsum.photos/400/250?random=8',
      'title': 'Tree Planting Event',
      'description': 'Participate in our community tree planting event.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Soft background
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 2,
        title: const Text(
          "Challenges",
          style: TextStyle(
            fontFamily: 'NunitoSans',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () =>
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(" Ongoing Challenges"),
            SizedBox(
              height: 350, // Adjusted height
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ongoingChallenges.length,
                itemBuilder: (context, index) {
                  final challenge = ongoingChallenges[index];
                  return _buildChallengeCard(context, challenge, "Join", true);
                },
              ),
            ),
            _buildSectionHeader(" Upcoming Challenges"),
            Column(
              children: upcomingChallenges
                  .map((challenge) =>
                  _buildChallengeCard(context, challenge, "Info", false))
                  .toList(),
            ),
            _buildSectionHeader(" Events & Seminars"),
            Column(
              children: events
                  .map((event) =>
                  _buildChallengeCard(context, event, "Info", false))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Section Header Widget
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.green.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'NunitoSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget _buildChallengeCard(BuildContext context,
      Map<String, String> challenge, String buttonText, bool isHorizontal) {
    return Container(
      margin: EdgeInsets.only(bottom: 16, right: isHorizontal ? 10 : 0),
      width: isHorizontal ? 180 : double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              challenge['imageUrl']!,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  challenge['title']!,
                  style: const TextStyle(
                    fontFamily: 'NunitoSans',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  challenge['description']!,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonText == "Join"
                          ? Colors.green
                          : Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      // ✅ Fix: Pass the actual challenge data dynamically
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ChallengeDetailScreen(
                                challenge: challenge, // ✅ Now correctly passing data
                              ),
                        ),
                      );
                    },
                    child: Text(
                        buttonText, style: const TextStyle(fontSize: 14)),
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
