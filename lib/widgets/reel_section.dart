import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter/material.dart';
import 'reel_card.dart';

class ReelsSection extends StatelessWidget {
  final List<Map<String, String>> reelsData;
  final int gridCount;

  const ReelsSection({
    Key? key,
    required this.reelsData,
    this.gridCount = 2, // Change to 1 for a single-column grid
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Let outer scroll view handle scrolling
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: gridCount,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.66, // Adjust to suit your ReelCard dimensions
      ),
      itemCount: reelsData.length,
      itemBuilder: (context, index) {
        final reel = reelsData[index];
        return ReelCard(
          imageUrl: reel['imageUrl'] ?? '',
          title: reel['title'] ?? 'No Title',
          onTap: () {
            // Handle reel tap here
          },
        );
      },
    );
  }
}
