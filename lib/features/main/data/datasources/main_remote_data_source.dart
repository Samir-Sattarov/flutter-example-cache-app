
import '../../../../core/api/api_client.dart';
import '../../../../core/api/api_constants.dart';
import '../models/post_results_entity.dart';
import '../models/todo_results_entity.dart';

abstract class MainRemoteDataSource {
  Future<TodoResultsModel> getTodos();
  Future<PostResultsModel> getPosts();
}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiClient client;

  MainRemoteDataSourceImpl(this.client);

  @override
  Future<TodoResultsModel> getTodos() async {
    final response = await client.get(ApiConstants.todos);

    final results = TodoResultsModel.fromJson(response);

    return results;
  }

  @override
  Future<PostResultsModel> getPosts()async {
    final response = await client.get(ApiConstants.posts);

    final results = PostResultsModel.fromJson(response);

    return results;
  }
}
