part of 'todo_cubit.dart';

abstract class TodoState {
  const TodoState();
}

class TodoInitial extends TodoState {}

class TodoError extends TodoState {
  final String message;

  const TodoError({required this.message});
}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final TodoResultsEntity results;

  const TodoLoaded(this.results);
}
