import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

class ChallengesScreen extends StatelessWidget {
  ChallengesScreen({super.key});

  // Dummy data for featured challenges
  final List<Map<String, String>> featuredChallenges = [
    {
      'imageUrl': 'https://picsum.photos/200/300?random=1',
      'title': 'Zero-Waste Week',
      'description': 'Join us in reducing waste for a week!',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=2',
      'title': 'Meatless Monday',
      'description': 'Try a plant-based meal every Monday.',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=3',
      'title': 'Eco-Challenge',
      'description': 'Complete daily eco-friendly tasks.',
    },
  ];

  // Dummy data for ongoing challenges
  final List<Map<String, String>> ongoingChallenges = [
    {
      'imageUrl': 'https://picsum.photos/200/300?random=4',
      'title': 'Plastic Free Challenge',
      'description': 'Reduce plastic usage in your daily life.',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=5',
      'title': 'Sustainable Living',
      'description': 'Adopt sustainable habits at home.',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=6',
      'title': 'Green Commute',
      'description': 'Use eco-friendly transportation options.',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=7',
      'title': 'Energy Saving',
      'description': 'Conserve energy and reduce bills.',
    },
  ];

  // Dummy data for upcoming events
  final List<Map<String, String>> upcomingEvents = [
    {
      'imageUrl': 'https://picsum.photos/200/300?random=8',
      'title': 'Climate Webinar',
      'description': 'Join our webinar on climate change solutions.',
    },
    {
      'imageUrl': 'https://picsum.photos/200/300?random=9',
      'title': 'Local Tree Planting',
      'description': 'Participate in our community tree planting event.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return NeumorphicBackground(
      child: Scaffold(
        backgroundColor: Colors.indigoAccent,
        appBar: NeumorphicAppBar(
          title: const Text(
            "Challenges",
            style: TextStyle(
              fontFamily: 'NunitoSans',
              fontSize: 22,
              // overflow: ,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            NeumorphicButton(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              style: const NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              padding: const EdgeInsets.all(8),
              onPressed: () {
                // Announcement action
              },
              child: const Icon(Icons.announcement, color: Colors.white),
            ),
            NeumorphicButton(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              style: const NeumorphicStyle(
                shape: NeumorphicShape.convex,
                boxShape: NeumorphicBoxShape.circle(),
              ),
              padding: const EdgeInsets.all(8),
              onPressed: () {
                // Search action
              },
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Challenges Carousel
              const Text(
                "Featured Challenges",
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: featuredChallenges.length,
                  itemBuilder: (context, index) {
                    final challenge = featuredChallenges[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          depth: 4,
                          intensity: 0.8,
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(16),
                          ),
                        ),
                        child: Container(
                          width: 220,
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    challenge['imageUrl']!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                challenge['title']!,
                                style: const TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                challenge['description']!,
                                style: const TextStyle(fontSize: 12),
                              ),
                              const SizedBox(height: 8),
                              NeumorphicButton(
                                onPressed: () {
                                  // Join challenge action
                                },
                                style: const NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.stadium(),
                                  depth: 2,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                child: const Text(
                                  "Join",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Ongoing Challenges Grid
              const Text(
                "Ongoing Challenges",
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: ongoingChallenges.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  final challenge = ongoingChallenges[index];
                  return Neumorphic(
                    style: NeumorphicStyle(
                      depth: 4,
                      intensity: 0.8,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(16),
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to challenge detail
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.network(
                                challenge['imageUrl']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  challenge['title']!,
                                  style: const TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  challenge['description']!,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              // Upcoming Events Section
              const Text(
                "Upcoming Events",
                style: TextStyle(
                  fontFamily: 'NunitoSans',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: upcomingEvents.length,
                itemBuilder: (context, index) {
                  final event = upcomingEvents[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        depth: 4,
                        intensity: 0.8,
                        boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(16),
                        ),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(8),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            event['imageUrl']!,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          event['title']!,
                          style: const TextStyle(
                            fontFamily: 'NunitoSans',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          event['description']!,
                          style: const TextStyle(fontSize: 12),
                        ),
                        trailing: NeumorphicButton(
                          onPressed: () {
                            // Action to view event details or register
                          },
                          style: const NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.circle(),
                            depth: 2,
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Icon(Icons.arrow_forward, size: 16),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
