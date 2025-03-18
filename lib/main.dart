import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nisarg/screens/post_screen.dart';
import 'screens/home_screen.dart';
import 'screens/reels_screen.dart';
import 'screens/profile_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: 'Climate Action App',
      theme: theme,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        // '/posts': (context) => PostScreen(),
        '/create': (context) => const PostScreen(),
        '/reels': (context) => ReelsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
