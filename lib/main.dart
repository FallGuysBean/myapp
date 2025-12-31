import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFB11226),
        scaffoldBackgroundColor: const Color(0xFFF8F3F3),
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFB11226),
        title: const Text(
          "Special Olympics",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO BANNER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: const BoxDecoration(
                color: Color(0xFFB11226),
              ),
              child: Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double iconSize = constraints.maxWidth * 0.18;
                      return Icon(
                        Icons.emoji_events,
                        size: iconSize.clamp(50.0, 120.0), // clamp size
                        color: Colors.white,
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Special Olympics for Nevada",
                    style: TextStyle(
                      fontSize: (screenWidth * 0.08).clamp(24.0, 36.0),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Empowering athletes with intellectual disabilities through sport, inclusion, and opportunity.",
                    style: TextStyle(
                      fontSize: (screenWidth * 0.045).clamp(14.0, 20.0),
                      color: Colors.white70,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  sectionCard(
                    icon: Icons.groups,
                    title: "About the Special Olympics",
                    content:
                        "The Special Olympics is an international sports organization dedicated to empowering individuals "
                        "with intellectual disabilities through year-round sports training and athletic competition. "
                        "Athletes are provided opportunities to build physical fitness, demonstrate courage, experience joy, "
                        "and participate fully in their communities.",
                    screenWidth: screenWidth,
                  ),

                  const SizedBox(height: 30),

                  sectionCard(
                    icon: Icons.sports,
                    title: "Sports Included",
                    content:
                        "Sports:\n"
                        "• Athletics (Track & Field)\n"
                        "• Aquatics (Swimming)\n"
                        "• Basketball\n"
                        "• Bocce\n"
                        "• Bowling\n"
                        "• Cycling\n"
                        "• Football (Soccer)\n"
                        "• Golf\n"
                        "• Gymnastics\n"
                        "• Judo\n"
                        "• Powerlifting\n"
                        "• Softball\n"
                        "• Tennis\n"
                        "• Volleyball\n\n"
                        "Winter Sports:\n"
                        "• Alpine Skiing\n"
                        "• Cross-Country Skiing\n"
                        "• Figure Skating\n"
                        "• Floor Hockey\n"
                        "• Snowboarding\n"
                        "• Snowshoeing",
                    screenWidth: screenWidth,
                  ),

                  const SizedBox(height: 30),

                  sectionCard(
                    icon: Icons.favorite,
                    title: "Why It Matters",
                    content:
                        "The Special Olympics promotes inclusion, confidence, and equality. "
                        "Through athletics, athletes improve their physical health, build friendships, "
                        "and gain confidence that extends beyond sports. "
                        "The program continues to positively impact individuals, families, and communities across Nevada and beyond.",
                    screenWidth: screenWidth,
                  ),

                  const SizedBox(height: 30),

                  // Persuasion Section
                  sectionCard(
                    icon: Icons.location_city,
                    title: "Why Las Vegas Should Host the Special Olympics",
                    content:
                        "Hosting the Special Olympics in Las Vegas will bring tremendous benefits to the state and city. "
                        "It will attract tourism, highlight Nevada’s commitment to inclusion and community engagement, "
                        "and generate positive media coverage. You can voice your interest with these following organizations:\n\n"
                        "- Mayor of Las Vegas & City Council\n"
                        "- Clark County Commissioners\n"
                        "- Nevada Governor’s Office\n"
                        "- Las Vegas Convention & Visitors Authority (LVCVA)\n"
                        "- Special Olympics Nevada & Special Olympics International\n\n"
                        "We encourage public support! You can contribute your message or show support through the form linked below.",
                    screenWidth: screenWidth,
                  ),

                  const SizedBox(height: 20),

                  // Button to open Google Form
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        icon: const Icon(Icons.edit_note),
                        label: const Text(
                          "Contribute Your Support",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB11226),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          
                          const googleFormUrl = "https://forms.gle/beBjzCpsURQsH3da7";
                          launchUrlString(googleFormUrl);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget sectionCard({
    required IconData icon,
    required String title,
    required String content,
    required double screenWidth,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFFB11226), size: (screenWidth * 0.07).clamp(24.0, 50.0)),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: (screenWidth * 0.06).clamp(18.0, 28.0),
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFB11226),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            content,
            style: TextStyle(
              fontSize: (screenWidth * 0.045).clamp(14.0, 20.0),
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
