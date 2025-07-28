import 'package:flutter/material.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({super.key});

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  Widget build(BuildContext context) {
    return _buildAboutTab();
  }

  Widget _buildAboutTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        _buildDetailedHighlightItem(
            Icons.audiotrack_outlined, 'Dance, Cooking, Art', 'Category'),
        _buildDetailedHighlightItem(Icons.speed_outlined,
            'Beginners, intermediate, professionals', 'Level'),
        _buildDetailedHighlightItem(
            Icons.translate, 'English, Hindi', 'Language'),
        _buildDetailedHighlightItem(
            Icons.spa_outlined, 'Kids, Teenagers & Adults', 'Age limit'),
        _buildDetailedHighlightItem(Icons.flag_outlined,
            'In Studio, online, at your place', 'Mode of class'),
        const SizedBox(height: 24),
        const Text('About & Bio',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text(
            'Welcome to Taal Classes, where we believe in the power of language to connect cultures and enrich lives. Our mission is to provide engaging and interactive language learning experiences that cater to students of all ages and backgrounds. Whether you...',
            style: TextStyle(color: Colors.grey[400], height: 1.5)),
        TextButton(
            onPressed: () {},
            child:
                Text('Read More', style: TextStyle(color: Colors.yellow[700]))),
        const SizedBox(height: 24),
        const Text('Experience & Education',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        _buildExperienceItem(Icons.account_balance_outlined,
            'Established in 2008, serving the Dubai community for 16+ years.'),
        _buildExperienceItem(Icons.school_outlined,
            'Home to 10+ certified instructors across classical and modern Indian dance forms.'),
        _buildExperienceItem(Icons.verified_user_outlined,
            'Affiliated with the Indian Council for Cultural Relations (ICCR) for standardized curriculum.'),
        _buildExperienceItem(Icons.emoji_events_outlined,
            'Trained over 2,000 students, many of whom have performed on international stages.'),
        _buildExperienceItem(Icons.description_outlined,
            'Offers structured certificate programs and annual assessments.'),
        _buildExperienceItem(Icons.mic_external_on_outlined,
            'Hosts yearly stage productions, inter-school dance competitions, and community outreach programs.'),
      ],
    );
  }

  Widget _buildDetailedHighlightItem(
      IconData icon, String mainText, String subText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[400], size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mainText,
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
              const SizedBox(height: 2),
              Text(subText,
                  style: TextStyle(color: Colors.grey[500], fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.grey[400], size: 24),
          const SizedBox(width: 16),
          Expanded(
            child: Text(text,
                style: TextStyle(
                    color: Colors.grey[300], height: 1.5, fontSize: 15)),
          ),
        ],
      ),
    );
  }
}
