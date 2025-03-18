import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:nisarg/utils/constants.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/reel_section.dart';
import '../widgets/top_appbar.dart';
import '../widgets/card.dart';
import '../widgets/loader.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Simulated loading state for demonstration purposes.
  bool isLoading = false;
  int _currentIndex = 0;

  // Dummy reels data for demonstration.
  final List<Map<String, String>> reelsData = [
    {
      'imageUrl': 'https://picsum.photos/200/300?random=1',
      'title': 'Reel One',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=2',
      'title': 'Reel Two',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=1',
      'title': 'Reel Three',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=1',
      'title': 'Reel One',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=1',
      'title': 'Reel Two',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=13',
      'title': 'Reel Three',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const TopAppBar(title: "Nisarg"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoading
              ? const AnimatedLoader()
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const NeumorphicCard(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            "Welcome to ${Constants.appTitle}!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "For You",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ReelsSection(reelsData: reelsData),
                    ],
                  ),
                ),
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
