import 'package:cache_example_app/core/api/api_exceptions.dart';
import 'package:cache_example_app/features/main/domain/entities/post_results_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../../domain/entities/todo_results_entity.dart';
import '../../domain/repository/main_repository.dart';
import '../datasources/main_remote_data_source.dart';

class MainRepositoryImpl extends MainRepository {
  final MainRemoteDataSource remoteDataSource;

  MainRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<AppError, TodoResultsEntity>> getTodos() async {
    try {
      final response = await remoteDataSource.getTodos();
      return Right(response);
    } on ExceptionWithMessage catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.msgError,
          errorMessage: error.toString(),
        ),
      );
    } on UnauthorisedException catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.unauthorised,
          errorMessage: error.toString(),
        ),
      );
    } catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.api,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<AppError, PostResultsEntity>> getPosts() async {
    try {
      final response = await remoteDataSource.getPosts();
      return Right(response);
    } on ExceptionWithMessage catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.msgError,
          errorMessage: error.toString(),
        ),
      );
    } on UnauthorisedException catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.unauthorised,
          errorMessage: error.toString(),
        ),
      );
    } catch (error) {
      return Left(
        AppError(
          appErrorType: AppErrorType.api,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
