import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../entities/post_results_entity.dart';
import '../entities/todo_results_entity.dart';

abstract class MainRepository {
  Future<Either<AppError, TodoResultsEntity>> getTodos();
  Future<Either<AppError, PostResultsEntity>> getPosts();
}
