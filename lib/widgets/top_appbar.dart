import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
// import 'package:nisarg/utils/theme.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TopAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: Neumorphic(
        style: const NeumorphicStyle(
          depth: 4, // Neumorphic elevation effect
          color: Colors.blueAccent, // Background color
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: preferredSize.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'NunitoSans',
                  // Custom font
                  fontSize: 22,
                  // Adjusted size for visibility
                  fontWeight: FontWeight.w800,
                  // Extra bold for a strong look
                  color: Colors.black,
                  // Text color
                  letterSpacing: 1.2, // Slight spacing for readability
                ),
              ),
              NeumorphicButton(
                margin: const EdgeInsets.only(right: 12),
                style: const NeumorphicStyle(
                  shape: NeumorphicShape.convex, // Slightly raised button
                  depth: 2, // Button depth
                  boxShape: NeumorphicBoxShape.circle(),
                ),
                padding: const EdgeInsets.all(8),
                onPressed: () {
                  // Add search action or any other action here
                },
                child: const Icon(Icons.search, color: Colors.blueAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
