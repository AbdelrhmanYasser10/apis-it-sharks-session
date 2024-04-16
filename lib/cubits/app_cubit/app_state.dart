part of 'app_cubit.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}


//Loading
class GetPostsLoading extends AppState{}
// get all posts
class GetPostsSuccessfully extends AppState{
  final List<PostModel> posts;
  GetPostsSuccessfully({required this.posts});
}

// Error
class GetPostsError extends AppState{
  final String message;
  GetPostsError({required this.message});
}