import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class AnimatedLoader extends StatelessWidget {
  const AnimatedLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Neumorphic(
        style: const NeumorphicStyle(
          shape: NeumorphicShape.convex,
          depth: 8,
          boxShape: NeumorphicBoxShape.circle(),
        ),
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
