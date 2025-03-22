import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';


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
          color: Colors.green, // Background color
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
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                    letterSpacing: 1.2,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NeumorphicButton(
                      style: const NeumorphicStyle(
                        shape: NeumorphicShape.convex,
                        depth: 2,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      padding: const EdgeInsets.all(8),
                      onPressed: () {
                        // Add search action or any other action here
                      },
                      child: const Icon(Icons.search, color: Colors.lightGreen),
                    ),
                    const SizedBox(width: 4), // Minimal gap between buttons
                    // NeumorphicButton(
                    //   style: const NeumorphicStyle(
                    //     shape: NeumorphicShape.convex,
                    //     depth: 2,
                    //     boxShape: NeumorphicBoxShape.circle(),
                    //   ),
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => ChallengesScreen()),
                    //     );
                    //   },
                    //   child: const Icon(Icons.local_activity,
                    //       color: Colors.lightGreen),
                    // ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
