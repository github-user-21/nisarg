import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter/material.dart';

class ReelCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onTap;

  const ReelCard({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      margin: const EdgeInsets.all(8),
      style: NeumorphicStyle(
        depth: 4,
        intensity: 0.8,
        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(16)),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 200,
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 7,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(16)),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(16)),
                  ),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'NunitoSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
