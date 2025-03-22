import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});

  // Dummy Data for Community Posts
  final List<Map<String, dynamic>> communityPosts = [
    {
      'title': 'Mumbai Cleaners Club',
      'subtitle': 'Juhu Beach Clean-Up 🌊',
      'date': '10/10/2026',
      'time': '06:00 AM',
      'description': 'Join Mumbai Cleaners Club next month to clean Juhu Beach!',
      'contact': 'xyz',
      'highlight': "Let's make a difference together!",
      'highlightColor': Colors.green.shade100,
      'icon': Icons.cleaning_services,
    },
    {
      'title': 'Vietnam local NGO',
      'subtitle': 'NGO Recruitment',
      'date': '12/02/2026',
      'position': 'Social marketing volunteer',
      'location': 'Vietnam',
      'description':
      'Help us make a difference in Climate change!\nSend your resume to xyz@com',
      'highlight': "We're Hiring!",
      'highlightColor': Colors.orange.shade100,
      'icon': Icons.volunteer_activism,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 2,
        title: const Text(
          "Community",
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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "🌿 Community",
              style: TextStyle(
                fontFamily: 'NunitoSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: communityPosts.length,
                itemBuilder: (context, index) {
                  return _buildCommunityCard(communityPosts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 Community Card Widget
  Widget _buildCommunityCard(Map<String, dynamic> post) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 3,
        shadowLightColor: Colors.grey.shade300,
        shadowDarkColor: Colors.grey.shade500,
        color: Colors.white,
        border: NeumorphicBorder(color: Colors.grey.shade200, width: 0.8),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with Icon
          Row(
            children: [
              Icon(post['icon'], color: Colors.green, size: 22),
              const SizedBox(width: 8),
              Text(
                post['title'],
                style: const TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          // Subtitle
          Text(
            post['subtitle'],
            style: const TextStyle(
              fontFamily: 'NunitoSans',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          // Date & Time Row
          if (post.containsKey('date'))
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text(post['date'], style: const TextStyle(fontSize: 14)),
                if (post.containsKey('time')) ...[
                  const SizedBox(width: 10),
                  const Icon(Icons.access_time, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(post['time'], style: const TextStyle(fontSize: 14)),
                ],
              ],
            ),
          const SizedBox(height: 4),
          // Position & Location
          if (post.containsKey('position'))
            Row(
              children: [
                const Icon(Icons.work, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text("Position: ${post['position']}",
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
          if (post.containsKey('location'))
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Colors.grey),
                const SizedBox(width: 4),
                Text("Location: ${post['location']}",
                    style: const TextStyle(fontSize: 14)),
              ],
            ),
          const SizedBox(height: 6),
          // Description
          Text(
            post['description'],
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
          const SizedBox(height: 8),
          // Highlighted Note
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: post['highlightColor'],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              post['highlight'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          if (post.containsKey('contact'))
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "For details, contact: ${post['contact']}",
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
        ],
      ),
    );
  }
}
