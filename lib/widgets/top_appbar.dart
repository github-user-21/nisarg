import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TopAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return NeumorphicAppBar(
      title: Text(title),
      actions: [
        NeumorphicButton(
          margin: const EdgeInsets.only(right: 12),
          style: const NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.circle(),
          ),
          padding: const EdgeInsets.all(8),
          onPressed: () {
            // Add search action or any other action here
          },
          child: const Icon(Icons.search),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
