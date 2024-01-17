import 'package:cache_example_app/core/entities/no_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/todo_results_entity.dart';
import '../../../domain/usecases/todo_usecases.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final GetTodoUsecase getTodoUsecase;
  TodoCubit(this.getTodoUsecase) : super(TodoInitial());

  load() async {
    final response = await getTodoUsecase.call(NoParams());

    response.fold((l) => emit(TodoError(message: l.errorMessage)),
        (r) => emit(TodoLoaded(r)));
  }
}
