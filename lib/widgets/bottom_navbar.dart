import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar(
      {super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.all(12),
      style: NeumorphicStyle(
        depth: -5,
        intensity: 0.8,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.post_add), label: "Posts"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Create"),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection), label: "Reels"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
