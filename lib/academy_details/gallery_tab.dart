import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'photo_viewer_page.dart';

class GalleryTab extends StatelessWidget {
  final List<String> galleryImages;

  const GalleryTab({super.key, required this.galleryImages});

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.all(12.0),
      crossAxisCount: 3,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
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
