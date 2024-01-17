import 'package:flutter/material.dart';

import '../../domain/entities/post_entity.dart';

class PostCardWidget extends StatelessWidget {
  final PostEntity entity;
  const PostCardWidget({Key? key, required this.entity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entity.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            entity.body,
          ),
          const SizedBox(height: 10),

        ],
      ),
    );
  }
}
