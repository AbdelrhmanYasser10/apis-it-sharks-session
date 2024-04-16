part of 'comment_cubit.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

class GetCommentsLoading extends CommentState{}

class GetCommentsSuccessfully extends CommentState{
  final List<CommentModel> comments;
  GetCommentsSuccessfully({required this.comments});
}

class GetCommentsError extends CommentState{
  final String message;
  GetCommentsError({required this.message});
}