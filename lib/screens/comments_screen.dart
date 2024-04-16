import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/cubits/comment_cubit/comment_cubit.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentCubit, CommentState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is GetCommentsLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else if(state is GetCommentsSuccessfully){
          if(state.comments.isEmpty){
            return const Scaffold(
              body: Center(
                child: Text(
                  "There's no comments on this post",
                ),
              ),
            );
          }
          else{
            // TODO:: THE UI FOR COMMENTS SCREEN
            return Scaffold(
              body: SafeArea(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Text(
                        state.comments[index].body,
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(height: 20.0,),
                    itemCount: state.comments.length,
                ),
              ),
            );
          }
        }
        else if(state is GetCommentsError){
          return Scaffold(
            body: Center(
              child: Text(
                state.message,
              ),
            ),
          );
        }
        else{
          return const SizedBox();
        }
      },
    );
  }
}
