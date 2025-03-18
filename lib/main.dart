import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

// import 'package:riverpod/;
import 'screens/home_screen.dart';
import 'utils/theme.dart';
import 'utils/constants.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      theme: theme,
      home: HomeScreen(),
    );
  }
}
