import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:nisarg/screens/community_screen.dart';
import 'package:nisarg/utils/constants.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/top_appbar.dart';
import '../widgets/card.dart';
import '../widgets/loader.dart';
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

  //
  Widget _getCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return Center(child: Text("Create posts to see here!"));
      case 2:
        return PostScreen();
      case 3:
        return CommunityScreen();
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
            // Welcome Message
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

            // Post Feed (Reels-Style)
            Column(
              children: List.generate(reelsData.length, (index) {
                final reel = reelsData[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // User Info
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
                              child:
                              Icon(Icons.person, color: Colors.white),
                            ),
                            SizedBox(width: 10),
                            Text(
                              "User123",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ),

                      // Post Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          reel['imageUrl']!,
                          width: double.infinity,
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      ),

                      // Action Buttons (Like, Comment, Share, Save)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.favorite_border),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon:
                                  const Icon(Icons.comment_outlined),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: const Icon(Icons.share_outlined),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            IconButton(
                              icon: const Icon(Icons.bookmark_border),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),

                      // Hashtags
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "#GoGreen, #ZeroWaste",
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: Colors.grey,
        appBar: const TopAppBar(title: "Nisarg",),
        body: _getCurrentScreen(),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
        ),
      ),
    );
  }
}
