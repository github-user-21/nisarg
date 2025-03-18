import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import '../widgets/top_appbar.dart';
import '../widgets/bottom_navbar.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        appBar: const TopAppBar(title: "Reels"),
        body: const Center(child: Text('Reels Content Coming Soon')),
        bottomNavigationBar: BottomNavBar(
          currentIndex: 3, // Adjust index as needed for your navigation
          onTap: (int index) {
            // Implement navigation logic here
          },
        ),
      ),
    );
  }
}
