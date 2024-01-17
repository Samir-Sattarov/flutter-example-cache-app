import 'package:dartz/dartz.dart';

import '../../../../core/entities/app_error.dart';
import '../../../../core/entities/no_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/post_results_entity.dart';
import '../repository/main_repository.dart';

class GetPostsUsecase extends UseCase<PostResultsEntity, NoParams> {
  final MainRepository mainRepository;

  GetPostsUsecase(this.mainRepository);

  @override
  Future<Either<AppError, PostResultsEntity>> call(NoParams params) =>
      mainRepository.getPosts();
}
