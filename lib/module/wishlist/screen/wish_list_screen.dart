import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final List<Map<String, dynamic>> courses = [
      {
        'title': 'AWS Cloud for beginner (Vietnamese)',
        'author': 'Linh Nguyen',
        'rating': 4.8,
        'reviews': 923,
        'price': 'đ1.799.000',
        'image': 'https://dummyimage.com/300',
        'tag': 'Bán chạy nhất',
        'tagColor': Colors.yellow[700],
      },
      {
        'title': 'ERP của doanh nghiệp SME - SAP Business One cho người mới',
        'author': 'Tiến Lê',
        'rating': 4.9,
        'reviews': 21,
        'price': 'đ2.499.000',
        'image': 'https://dummyimage.com/300',
        'tag': 'Thịnh hành & mới',
        'tagColor': Colors.pink[300],
      },
      {
        'title': 'Tự động hoá công việc bằng AI agent và n8n',
        'author': 'Thanh Nguyen',
        'rating': 4.7,
        'reviews': 36,
        'price': 'đ799.000',
        'image': 'https://dummyimage.com/300',
        'tag': 'Thịnh hành & mới',
        'tagColor': Colors.pink[300],
      },
    ];
    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.surface,
        title: Text('Mong muốn',
            style: textTheme.titleLarge
                ?.copyWith(color: theme.colorScheme.onSurface)),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    course['image'],
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course['title'],
                        style: textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        course['author'],
                        style: textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '${course['rating']} ',
                            style: textTheme.bodyLarge?.copyWith(
                                color: theme.colorScheme.onSurface,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '(${course['reviews']})',
                            style: textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        course['price'],
                        style: textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.onSurface,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: course['tagColor'],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          course['tag'],
                          style: textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
