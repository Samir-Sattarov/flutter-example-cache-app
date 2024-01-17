import 'package:equatable/equatable.dart';

import 'post_entity.dart';

class PostResultsEntity extends Equatable {
  final List<PostEntity> posts;

  const PostResultsEntity({
    required this.posts,
  });

  factory PostResultsEntity.empty() {
    return const PostResultsEntity(
      posts: [],
    );
  }

  @override
  List<Object?> get props => [posts.length];
}
