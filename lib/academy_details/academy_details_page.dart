import 'package:flutter/material.dart';
import 'class_card.dart';
import 'class_model.dart';
import 'review_model.dart';
import 'filter_sheet.dart';

class AcademyDetailsPage extends StatefulWidget {
  const AcademyDetailsPage({super.key});

  @override
  State<AcademyDetailsPage> createState() => _AcademyDetailsPageState();
}

class _AcademyDetailsPageState extends State<AcademyDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  // int _selectedCategoryIndex = 0;

  final List<ClassInfo> classList = const [
    ClassInfo(
      imageUrl: 'assets/dancestyle.png',
      category: 'BOLLYWOOD',
      title: 'Kathak Classes',
      price: 'AED 456',
      originalPrice: 'AED 587',
      discount: '24% OFF',
      tag: 'In Studio',
      bottomText: 'Flexible Sessions',
    ),
    ClassInfo(
      imageUrl: 'assets/dancestyle.png',
      category: 'BOLLYWOOD',
      title: 'ALL DANCESTYLE',
      price: 'AED 456',
      originalPrice: 'AED 587',
      discount: '24% OFF',
      tag: 'Online',
      bottomText: 'Next Batch Starts From 15 May, 2025',
    ),
    ClassInfo(
      imageUrl: 'assets/dancestyle.png',
      category: 'CLASSICAL',
      title: 'Bharatanatyam',
      price: 'AED 456',
      originalPrice: 'AED 587',
      discount: '24% OFF',
      tag: 'At Your Place',
      bottomText: 'Next Batch Starts From 15 May, 2025',
    ),
    ClassInfo(
      imageUrl: 'assets/dancestyle.png',
      category: 'BOLLYWOOD',
      title: 'Wedding & Events Choreography',
      price: 'AED 456',
      originalPrice: 'AED 587',
      discount: '24% OFF',
      tag: 'In Studio',
      bottomText: 'Next Batch Starts From 15 May, 2025',
    ),
  ];
  final List<String> galleryImages = [
    'assets/gallery1.jpg',
    'assets/gallery2.jpg',
    'assets/gallery3.jpg',
    'assets/gallery4.jpg',
    'assets/gallery5.jpg',
    'assets/gallery6.jpg',
    'assets/gallery7.jpg',
    'assets/gallery8.jpg',
    'assets/gallery9.jpg',
    'assets/gallery10.jpg',
    'assets/gallery11.jpg',
  ];
  final List<ReviewInfo> reviews = const [
    ReviewInfo(
      profileImageUrl: 'assets/profile.png',
      name: 'Shane Watson',
      date: '1 day ago',
      rating: 5.0,
      comment:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
    ),
    ReviewInfo(
      profileImageUrl: 'assets/profile.png',
      name: 'Shane Watson',
      date: '1 day ago',
      rating: 5.0,
      comment:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
    ),
    ReviewInfo(
      profileImageUrl: 'assets/profile.png',
      name: 'Steve Smith',
      date: '2 days ago',
      rating: 4.0,
      comment: 'A great place to learn and grow! Highly recommended.',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            backgroundColor: const Color(0xFF1A1A1A),
            pinned: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/dancer.jpg',
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.yellow, size: 16),
                      const SizedBox(width: 4),
                      Text('4 (${classList.length * 1891} reviews)'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Taal Performing Arts By Mr. Santosh',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.grey[400],
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Dubai, United Arab Emirates',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            delegate: _SliverAppBarDelegate(
              TabBar(
                controller: _tabController,
                labelColor: Colors.yellow[700],
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.yellow[700],
                indicatorSize: TabBarIndicatorSize.label,
                tabs: const [
                  Tab(text: 'About'),
                  Tab(text: 'Services'),
                  Tab(text: 'Gallery'),
                  Tab(text: 'Ratings'),
                ],
              ),
            ),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 900,
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildAboutTab(),
                  _buildServicesTab(),
                  _buildGalleryTab(),
                  _buildRatingsTab(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailedHighlightItem(
            Icons.audiotrack_outlined,
            'Dance, Cooking, Art',
            'Level',
          ),
          _buildDetailedHighlightItem(
            Icons.speed_outlined,
            'Beginners, intermediate, professionals',
            'Level',
          ),
          _buildDetailedHighlightItem(
            Icons.translate,
            'English, Hindi',
            'Language',
          ),
          _buildDetailedHighlightItem(
            Icons.spa_outlined,
            'Kids, Teenagers & Adults',
            'Age limit',
          ),
          _buildDetailedHighlightItem(
            Icons.flag_outlined,
            'In Studio, online, at your place',
            'Mode of class',
          ),
          const SizedBox(height: 24),

          const Text(
            'About & Bio',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Welcome to Taal Classes, where we believe in the power of language to connect cultures and enrich lives. Our mission is to provide engaging and interactive language learning experiences that cater to students of all ages and backgrounds. Whether you...',
            style: TextStyle(color: Colors.grey[400], height: 1.5),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Read More',
              style: TextStyle(color: Colors.yellow[700]),
            ),
          ),
          const SizedBox(height: 24),

          const Text(
            'Experience & Education',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildExperienceItem(
            Icons.account_balance_outlined,
            'Established in 2008, serving the Dubai community for 16+ years.',
          ),
          _buildExperienceItem(
            Icons.school_outlined,
            'Home to 10+ certified instructors across classical and modern Indian dance forms.',
          ),
          _buildExperienceItem(
            Icons.verified_user_outlined,
            'Affiliated with the Indian Council for Cultural Relations (ICCR) for standardized curriculum.',
          ),
          _buildExperienceItem(
            Icons.emoji_events_outlined,
            'Trained over 2,000 students, many of whom have performed on international stages.',
          ),
          _buildExperienceItem(
            Icons.description_outlined,
            'Offers structured certificate programs and annual assessments.',
          ),
          _buildExperienceItem(
            Icons.mic_external_on_outlined,
            'Hosts yearly stage productions, inter-school dance competitions, and community outreach programs.',
          ),
        ],
      ),
    );
  }

  Widget _buildDetailedHighlightItem(
    IconData icon,
    String mainText,
    String subText,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[400], size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainText,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 2),
              Text(
                subText,
                style: TextStyle(color: Colors.grey[500], fontSize: 14),
              ),
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
            child: Text(
              text,
              style: TextStyle(
                color: Colors.grey[300],
                height: 1.5,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryTab() {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.6,
      ),
      itemCount: galleryImages.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            galleryImages[index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) =>
                Container(color: Colors.grey[800]),
          ),
        );
      },
    );
  }

  Widget _buildRatingsTab() {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '4.9 / 5.0 ⭐⭐⭐⭐⭐',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('420 Reviews', style: TextStyle(color: Colors.grey[400])),
          const SizedBox(height: 16),
          _buildRatingBar('5 Star', 0.9),
          _buildRatingBar('4 Star', 0.05),
          _buildRatingBar('3 Star', 0.03),
          _buildRatingBar('2 Star', 0.01),
          _buildRatingBar('1 Star', 0.01),
          const SizedBox(height: 24),
          for (int i = 0; i < reviews.length; i++) ...[
            _buildReviewCard(reviews[i]),
            if (i < reviews.length - 1)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Divider(color: Colors.white24, thickness: 1),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildRatingBar(String label, double percentage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(label, style: TextStyle(color: Colors.grey[400])),
          const SizedBox(width: 8),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: percentage,
                backgroundColor: Colors.grey[800],
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[700]!),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(ReviewInfo review) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(review.profileImageUrl),
            onBackgroundImageError: (exception, stackTrace) {},
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      review.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.yellow[700],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.black, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            review.rating.toString(),
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(review.date, style: TextStyle(color: Colors.grey[500])),
                const SizedBox(height: 8),
                Text(
                  review.comment,
                  style: TextStyle(color: Colors.grey[300], height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesTab() {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Classes(${classList.length})',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.white),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => const FilterSheet(),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _buildCategoryChip('DANCE', Icons.music_note, true),
            const SizedBox(width: 12),
            _buildCategoryChip('COOKING', Icons.kitchen, false),
            const SizedBox(width: 12),
            _buildCategoryChip('ART', Icons.color_lens, false),
          ],
        ),
        const SizedBox(height: 24),
        Column(
          children: classList.map((classInfo) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ClassCard(
                imageUrl: classInfo.imageUrl,
                category: classInfo.category,
                title: classInfo.title,
                price: classInfo.price,
                originalPrice: classInfo.originalPrice,
                discount: classInfo.discount,
                tag: classInfo.tag,
                bottomText: classInfo.bottomText,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCategoryChip(String label, IconData icon, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.yellow[700] : Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16, color: isSelected ? Colors.black : Colors.white),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);
  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: const Color(0xFF1A1A1A), child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
