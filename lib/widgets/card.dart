import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NeumorphicCard extends StatelessWidget {
  final Widget child;

  const NeumorphicCard({
    super.key,
    required this.child,

  });

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 4,
        intensity: 0.6,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }
}
