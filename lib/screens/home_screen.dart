import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/top_appbar.dart';
import '../widgets/button.dart';
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

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const TopAppBar(title: "Home"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: isLoading
              ? AnimatedLoader()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    NeumorphicCard(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Welcome to Climate Action!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    NeumorphicButtonWidget(
                      text: "Get Started",
                      onPressed: () {
                        // Dummy action to simulate a loading effect.
                        setState(() {
                          isLoading = true;
                        });
                        Future.delayed(Duration(seconds: 2), () {
                          setState(() {
                            isLoading = false;
                          });
                        });
                      },
                    ),
                  ],
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
