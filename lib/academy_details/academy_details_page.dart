import 'package:flutter/material.dart';
import 'class_model.dart';
import 'review_model.dart';

import 'about_tab.dart';
import 'gallery_tab.dart';
import 'ratings_tab.dart';
import 'services_tab.dart';

class AcademyDetailsPage extends StatefulWidget {
  const AcademyDetailsPage({super.key});

  @override
  State<AcademyDetailsPage> createState() => _AcademyDetailsPageState();
}

class _AcademyDetailsPageState extends State<AcademyDetailsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isFavorited = false;

  final List<ClassInfo> classList = const [
    ClassInfo(
        imageUrl: 'assets/dancestyle.png',
        category: 'BOLLYWOOD',
        title: 'Kathak Classes',
        price: 'AED 456',
        originalPrice: 'AED 587',
        discount: '24% OFF',
        tag: 'In Studio',
        bottomText: 'Flexible Sessions'),
    ClassInfo(
        imageUrl: 'assets/dancestyle.png',
        category: 'BOLLYWOOD',
        title: 'ALL DANCESTYLE',
        price: 'AED 456',
        originalPrice: 'AED 587',
        discount: '24% OFF',
        tag: 'Online',
        bottomText: 'Next Batch Starts From 15 May, 2025'),
    ClassInfo(
        imageUrl: 'assets/dancestyle.png',
        category: 'CLASSICAL',
        title: 'Bharatanatyam',
        price: 'AED 456',
        originalPrice: 'AED 587',
        discount: '24% OFF',
        tag: 'At Your Place',
        bottomText: 'Next Batch Starts From 15 May, 2025'),
    ClassInfo(
        imageUrl: 'assets/dancestyle.png',
        category: 'BOLLYWOOD',
        title: 'Wedding & Events Choreography',
        price: 'AED 456',
        originalPrice: 'AED 587',
        discount: '24% OFF',
        tag: 'In Studio',
        bottomText: 'Next Batch Starts From 15 May, 2025'),
  ];
  final List<String> galleryImages = [
    'assets/gallery7.jpg',
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
    'assets/gallery3.jpg',
    'assets/gallery4.jpg',
    'assets/gallery5.jpg',
    'assets/gallery6.jpg',
    'assets/gallery7.jpg',
  ];
  final List<ReviewInfo> reviews = const [
    ReviewInfo(
        profileImageUrl: 'assets/profile.png',
        name: 'Shane Watson',
        date: '1 day ago',
        rating: 5.0,
        comment:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
    ReviewInfo(
        profileImageUrl: 'assets/profile.png',
        name: 'Steve Smith',
        date: '2 days ago',
        rating: 4.0,
        comment:
            'A great place to learn and grow! Highly recommended. It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
    ReviewInfo(
        profileImageUrl: 'assets/profile.png',
        name: 'Steve Smith',
        date: '2 days ago',
        rating: 4.0,
        comment: 'A great place to learn and grow! Highly recommended.'),
    ReviewInfo(
        profileImageUrl: 'assets/profile.png',
        name: 'Steve Smith',
        date: '2 days ago',
        rating: 4.0,
        comment:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              backgroundColor: const Color(0xFF1A1A1A),
              pinned: true,
              floating: true,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    _isFavorited ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorited ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isFavorited = !_isFavorited;
                    });
                  },
                ),
                IconButton(
                  icon:
                      const Icon(Icons.notifications_none, color: Colors.white),
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
                        Text('4 (${reviews.length} reviews)'),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Taal Performing Arts By Mr. Santosh',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on,
                            color: const Color.fromARGB(255, 245, 221, 11),
                            size: 16),
                        const SizedBox(width: 4),
                        Text('Dubai, United Arab Emirates',
                            style: TextStyle(color: Colors.grey[400])),
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
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelColor: Colors.yellow[700],
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.yellow[700],
                  indicatorSize: TabBarIndicatorSize.label,
                  labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
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
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            const AboutTab(),
            ServicesTab(classList: classList),
            GalleryTab(galleryImages: galleryImages),
            RatingsTab(reviews: reviews),
          ],
        ),
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
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: const Color(0xFF1A1A1A), child: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) => false;
}
