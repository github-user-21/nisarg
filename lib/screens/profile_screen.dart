import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import '../widgets/top_appbar.dart';
import '../widgets/bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  final String username = 'EcoWarrior123';
  final int posts = 25;
  final int points = 1200;
  final int followers = 340;
  final int following = 180;

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: const TopAppBar(title: "My Profile"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildProfileHeader(context),
              const SizedBox(height: 10),
              _buildProfileStats(),
              const Divider(thickness: 1),
              _buildBadgesSection(),
              const Divider(thickness: 1),
              _buildPostList(context),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 4, // Assuming Profile is at index 4
          onTap: (index) {
            // Implement your navigation logic here
          },
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Using a network image for the profile avatar
          const CircleAvatar(
            radius: 45,
            backgroundImage:
                NetworkImage('https://picsum.photos/200/200?random=100'),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, size: 18),
                  label: const Text("Edit Profile"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileStats() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatCard("Posts", posts.toString(), Icons.article),
          _buildStatCard("Points", points.toString(), Icons.star),
          _buildStatCard("Followers", followers.toString(), Icons.group),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String count, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.green[700], size: 26),
        const SizedBox(height: 4),
        Text(count,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(title, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
      ],
    );
  }

  Widget _buildBadgesSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Badges',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 8,
            children: [
              _buildBadgeChip('Tree Planter', Icons.park, Colors.green),
              _buildBadgeChip('Zero Waste', Icons.recycling, Colors.orange),
              _buildBadgeChip('Eco Hero', Icons.emoji_events, Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeChip(String label, IconData icon, Color color) {
    return Chip(
      avatar: Icon(icon, color: Colors.white, size: 16),
      label: Text(label, style: const TextStyle(color: Colors.white)),
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }

  Widget _buildPostList(BuildContext context) {
    final postsData = [
      {
        "content": "Planted 5 trees today!",
        "time": "2 days ago",
        "likes": 30,
        "comments": 5,
        "image": "https://picsum.photos/200/300?random=10"
      },
      {
        "content": "Started a community clean-up!",
        "time": "5 days ago",
        "likes": 45,
        "comments": 12,
        "image": "https://picsum.photos/200/300?random=11"
      },
      {
        "content": "Switched to zero waste products 🌱",
        "time": "1 week ago",
        "likes": 20,
        "comments": 3,
        "image": "https://picsum.photos/200/300?random=12"
      }
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text('My Posts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ...postsData.map((post) => _buildPostCard(context, post)).toList(),
      ],
    );
  }

  Widget _buildPostCard(BuildContext context, Map<String, dynamic> post) {
    final double cardWidth = MediaQuery.of(context).size.width - 32;
    return Container(
      width: cardWidth,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                post["image"],
                height: 180,
                width: cardWidth,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                post["content"],
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
              child: Text(
                '${post["time"]} • ${post["likes"]} likes • ${post["comments"]} comments',
                style: TextStyle(color: Colors.grey[600], fontSize: 13),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
