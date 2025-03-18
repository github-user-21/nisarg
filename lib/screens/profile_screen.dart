import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username = 'EcoWarrior123';
  final int posts = 25;
  final int points = 1200;
  final int followers = 340;
  final int following = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(context),
            SizedBox(height: 10),
            _buildProfileStats(),
            Divider(thickness: 1),
            _buildBadgesSection(),
            Divider(thickness: 1),
            _buildPostList(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage('assets/user.jpg'),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(username,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.edit, size: 18),
                  label: Text("Edit Profile"),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
        SizedBox(height: 4),
        Text(count,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
          Text('Badges',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
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
      label: Text(label, style: TextStyle(color: Colors.white)),
      backgroundColor: color,
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    );
  }

  Widget _buildPostList() {
    final posts = [
      {
        "content": "Planted 5 trees today!",
        "time": "2 days ago",
        "likes": 30,
        "comments": 5,
        "image": "assets/trees.jpg"
      },
      {
        "content": "Started a community clean-up!",
        "time": "5 days ago",
        "likes": 45,
        "comments": 12,
        "image": "assets/cleanup.jpg"
      },
      {
        "content": "Switched to zero waste products 🌱",
        "time": "1 week ago",
        "likes": 20,
        "comments": 3,
        "image": "assets/zero_waste.jpg"
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text('My Posts',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        ...posts.map((post) => _buildPostCard(post)).toList(),
      ],
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(post["image"], height: 180, width: double.infinity, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(post["content"],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4),
            child: Text(
              '${post["time"]} • ${post["likes"]} likes • ${post["comments"]} comments',
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
