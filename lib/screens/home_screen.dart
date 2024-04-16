import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/cubits/app_cubit/app_cubit.dart';
import 'package:untitled9/cubits/comment_cubit/comment_cubit.dart';
import 'package:untitled9/screens/comments_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        if(state is GetPostsLoading){
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        else if(state is GetPostsSuccessfully){
          if(state.posts.isEmpty){
            return Scaffold
              (
              backgroundColor: Colors.blueGrey.shade100,
              appBar: AppBar(
                backgroundColor: Colors.blueGrey.shade100,
                centerTitle: true,
                elevation: 0.0,
                title: const Text(
                  "Posts",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: const Center(
                child: Text(
                  "There's no posts right now"
                ),
              ),
            );
          }
          else{
            return Scaffold(
              backgroundColor: Colors.blueGrey.shade100,
              appBar: AppBar(
                backgroundColor: Colors.blueGrey.shade100,
                centerTitle: true,
                elevation: 0.0,
                title: const Text(
                  "Posts",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: Center(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          CommentCubit.get(context).getAllComments(postId: state.posts[index].id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_)=>const CommentsScreen(),
                              ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16.0)
                            ),
                            child: Column(
                              children: [
                                Text(
                                  state.posts[index].title,
                                  style:const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const Divider(),
                                Text(
                                    state.posts[index].description,
                                  style:const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 0.0,
                      );
                    },
                    itemCount: state.posts.length,
                ),
              ),
            );
          }
        }
        else if(state is GetPostsError){
          return Scaffold
            (
            backgroundColor: Colors.blueGrey.shade100,
            appBar: AppBar(
              backgroundColor: Colors.blueGrey.shade100,
              centerTitle: true,
              elevation: 0.0,
              title: const Text(
                "Posts",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Center(
              child: Text(
                  state.message
              ),
            ),
          );
        }
        else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}
