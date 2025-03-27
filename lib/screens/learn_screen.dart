import 'package:flutter/material.dart';

import 'home_screen.dart';

class LearnScreen extends StatefulWidget {
  const LearnScreen({super.key});

  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> topics = [
    {
      "title": "Carbon Footprint",
      "description":
      "The total amount of greenhouse gases (mainly CO2) emitted by human activities, like driving, flying, or manufacturing goods. Reducing your carbon footprint can be as simple as walking more, using energy-efficient appliances, or eating less meat.",
      "image": "https://picsum.photos/300/200?random=1"
    },
    {
      "title": "Deforestation",
      "description":
      "The clearing of forests for agriculture, logging, or urban expansion. It leads to loss of biodiversity, climate change, and disruption of ecosystems. Protecting forests by reducing paper usage and supporting reforestation projects is crucial.",
      "image": "https://picsum.photos/300/200?random=2"
    },
    {
      "title": "Plastic Pollution",
      "description":
      "Plastic waste contaminates oceans and harms marine life. Reducing single-use plastics, recycling properly, and supporting biodegradable alternatives help combat this growing issue.",
      "image": "https://picsum.photos/300/200?random=3"
    },
  ];

  void _nextTopic() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % topics.length;
    });
  }

  void _prevTopic() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + topics.length) % topics.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentTopic = topics[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Learn"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
        ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Topic Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  currentTopic["image"]!,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),

            RichText(
              text: TextSpan(
                children: [
                  // Title
                  TextSpan(
                    text: "${currentTopic["title"]}\n", // New line after title
                    style: const TextStyle(
                      fontFamily: "NunitoSans",
                      fontSize: 40,
                      // Bigger font size
                      fontWeight: FontWeight.w800,
                      // Extra bold
                      color: Colors.green,
                      height: 1.3, // Line height
                    ),
                  ),

                  // Spacing before description
                  const TextSpan(text: "\n"),

                  // Description
                  TextSpan(
                    text: currentTopic["description"],
                    style: const TextStyle(
                      fontFamily: "NunitoSans",
                      fontSize: 20,
                      // Slightly smaller for readability
                      fontWeight: FontWeight.w500,
                      // Medium weight for contrast
                      color: Colors.black87,
                      height: 1.5, // Improved line spacing
                    ),
                  ),
                ],
              ),
            ),


            const SizedBox(height: 20),

            // Navigation Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: _prevTopic,
                  icon: const Icon(Icons.arrow_left, size: 30),
                ),
                IconButton(
                  onPressed: _nextTopic,
                  icon: const Icon(Icons.arrow_right, size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
