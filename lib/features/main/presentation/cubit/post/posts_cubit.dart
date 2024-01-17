import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/no_params.dart';
import '../../../domain/entities/post_results_entity.dart';
import '../../../domain/usecases/post_usecases.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final GetPostsUsecase _getPostsUsecase;
  PostsCubit(this._getPostsUsecase) : super(PostsInitial());

  load() async {
    final response = await _getPostsUsecase.call(NoParams());

    response.fold((l) => emit(PostsError(message: l.errorMessage)),
        (r) => emit(PostsLoaded(r)));
  }
}
