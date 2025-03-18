import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:nisarg/screens/reels_screen.dart';
import 'package:nisarg/utils/constants.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/reel_section.dart';
import '../widgets/top_appbar.dart';
import '../widgets/card.dart';
import '../widgets/loader.dart';

// IMPORT YOUR OTHER SCREENS HERE 👇
import 'post_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  int _currentIndex = 0;

  final List<Map<String, String>> reelsData = [
    {'imageUrl': 'https://picsum.photos/200/300?random=1', 'title': 'Reel One'},
    {'imageUrl': 'https://picsum.photos/200/300?random=2', 'title': 'Reel Two'},
    {
      'imageUrl': 'https://picsum.photos/200/300?random=1',
      'title': 'Reel Three'
    },
    {'imageUrl': 'https://picsum.photos/200/300?random=1', 'title': 'Reel One'},
    {'imageUrl': 'https://picsum.photos/200/300?random=1', 'title': 'Reel Two'},
    {
      'imageUrl': 'https://picsum.photos/200/300?random=13',
      'title': 'Reel Three'
    },
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return Center(child: Text("Create posts to see here!"));
      case 2:
        return PostScreen();
      case 3:
        return ReelsScreen();
      case 4:
        return ProfileScreen();
      default:
        return _buildHomeContent();
    }
  }

  Widget _buildHomeContent() {
    return Padding(
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
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "For You",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  ReelsSection(reelsData: reelsData),
                ],
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: const TopAppBar(title: "Nisarg"),
        body: _getCurrentScreen(),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}
