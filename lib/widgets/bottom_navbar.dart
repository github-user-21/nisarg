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
        onTap: (index) {
          onTap(index);
          switch (index) {
            case 0:
              Navigator.pushReplacementNamed(context, '/home');
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/challenges');
              break;
            case 2:
              Navigator.pushReplacementNamed(context, '/learn');
              break;
            case 3:
              Navigator.pushReplacementNamed(context, '/community');
              break;
            case 4:
              Navigator.pushReplacementNamed(context, '/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: "Challenges"),
          BottomNavigationBarItem(icon: Icon(Icons.auto_stories), label: "Learn"),
          BottomNavigationBarItem(
              icon: Icon(Icons.group), label: "EcoHub"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
