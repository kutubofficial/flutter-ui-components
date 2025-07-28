import 'package:flutter/material.dart';
import 'class_card.dart';
import 'class_model.dart';
import 'filter_sheet.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  int _selectedCategoryIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return _buildServicesTab();
  }

  Widget _buildServicesTab() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                'Classes(${_selectedCategoryIndex == 0 ? classList.length : 0})',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
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
            _buildCategoryChip(
              'DANCE',
              Icons.music_note,
              _selectedCategoryIndex == 0,
              () {
                setState(() {
                  _selectedCategoryIndex = 0;
                });
              },
            ),
            const SizedBox(width: 12),
            _buildCategoryChip(
              'COOKING',
              Icons.kitchen,
              _selectedCategoryIndex == 1,
              () {
                setState(() {
                  _selectedCategoryIndex = 1;
                });
              },
            ),
            const SizedBox(width: 12),
            _buildCategoryChip(
              'ART',
              Icons.color_lens,
              _selectedCategoryIndex == 2,
              () {
                setState(() {
                  _selectedCategoryIndex = 2;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 24),
        if (_selectedCategoryIndex == 0)
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
                    bottomText: classInfo.bottomText),
              );
            }).toList(),
          )
        else
          _buildEmptyState(),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey[600]),
            const SizedBox(height: 16),
            Text('No Classes Available',
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Check back later for new classes in this category!',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey[500])),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(
      String label, IconData icon, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.yellow[700] : Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon,
                size: 16, color: isSelected ? Colors.black : Colors.white),
            const SizedBox(width: 8),
            Text(label,
                style: TextStyle(
                    color: isSelected ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
