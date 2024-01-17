part of 'posts_cubit.dart';

abstract class PostsState {
  const PostsState();
}

class PostsInitial extends PostsState {}

class PostsLoaded extends PostsState {
  final PostResultsEntity results;

  const PostsLoaded(this.results);
}

class PostsError extends PostsState {
  final String message;

  const PostsError({required this.message});
}

class PostsLoading extends PostsState {}
