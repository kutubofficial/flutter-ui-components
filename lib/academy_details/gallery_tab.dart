import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'photo_viewer_page.dart';

class GalleryTab extends StatefulWidget {
  const GalleryTab({super.key});

  @override
  State<GalleryTab> createState() => _GalleryTabState();
}

class _GalleryTabState extends State<GalleryTab> {
  final List<String> galleryImages = [
    'assets/gallery2.jpg',
    'assets/gallery3.jpg',
    'assets/gallery4.jpg',
    'assets/gallery5.jpg',
    'assets/gallery6.jpg',
    'assets/gallery3.jpg',
    'assets/gallery7.jpg',
    'assets/gallery8.jpg',
    'assets/gallery3.jpg',
    'assets/gallery4.jpg',
    'assets/gallery5.jpg',
    'assets/gallery6.jpg',
    'assets/gallery7.jpg',
    'assets/gallery8.jpg',
    'assets/gallery3.jpg',
    'assets/gallery9.jpg',
    'assets/gallery10.jpg',
    'assets/gallery11.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return _buildGalleryTab();
  }

  Widget _buildGalleryTab() {
    return MasonryGridView.count(
      padding: const EdgeInsets.all(12.0),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      itemCount: galleryImages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) =>
                    PhotoViewerPage(imagePath: galleryImages[index]),
              ),
            );
          },
          child: Hero(
            tag: galleryImages[index],
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(galleryImages[index], fit: BoxFit.cover),
            ),
          ),
        );
      },
    );
  }
}
