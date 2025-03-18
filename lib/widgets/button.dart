import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class NeumorphicButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const NeumorphicButtonWidget(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return NeumorphicButton(
      onPressed: onPressed,
      style: NeumorphicStyle(
        shape: NeumorphicShape.flat,
        depth: 4,
        intensity: 0.8,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
