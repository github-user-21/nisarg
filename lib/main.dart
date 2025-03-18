import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

// import 'package:riverpod/;
import 'screens/home_screen.dart';
import 'utils/theme.dart';
import 'utils/constants.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      theme: theme,
      home: HomeScreen(),
    );
  }
}
