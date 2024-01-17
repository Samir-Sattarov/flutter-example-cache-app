import '../../domain/entities/post_results_entity.dart';
import 'post_model.dart';

class PostResultsModel extends PostResultsEntity {
  const PostResultsModel({required super.posts});

  factory PostResultsModel.fromJson(List<dynamic> json) {
    return PostResultsModel(
      posts: json.map((e) => PostModel.fromJson(e)).toList(),
    );
  }
}
