import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'top_appbar.dart';
import 'bottom_navbar.dart';

class CommonScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final int currentIndex;
  final Function(int) onTap;

  const CommonScaffold({
    super.key,
    required this.title,
    required this.body,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        appBar: TopAppBar(title: title),
        body: body,
        bottomNavigationBar: BottomNavBar(
          currentIndex: currentIndex,
          onTap: onTap,
        ),
      ),
    );
  }
}
