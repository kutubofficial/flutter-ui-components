import 'package:flutter/material.dart';
import 'review_model.dart';

class RatingsTab extends StatelessWidget {
  final List<ReviewInfo> reviews;

  const RatingsTab({
    super.key,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text('4.9 / 5.0 ⭐⭐⭐⭐⭐',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
        Text('${reviews.length * 140} Reviews',
            style: TextStyle(color: Colors.grey[400])),
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
                valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(ReviewInfo review) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
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
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.black, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              review.rating.toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(review.date, style: TextStyle(color: Colors.grey[500])),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          review.comment,
          style: TextStyle(color: Colors.grey[300], height: 1.4),
        ),
      ],
    );
  }
}
