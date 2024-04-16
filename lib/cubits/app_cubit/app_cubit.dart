import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled9/model/post_model.dart';
import 'package:untitled9/network/dio_helper.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context)=>BlocProvider.of(context);

  void getAllPosts()async{
    emit(GetPostsLoading());
    try{
    Response response = await DioHelper.getData(endPoint: "posts");
    if(response.statusCode == 200 || response.statusCode == 201) {
      List<PostModel> posts = [];
      for (var element in response.data) {
        posts.add(PostModel.fromJson(element));
      }
      emit(GetPostsSuccessfully(posts: posts));
    }
    else{
      emit(GetPostsError(message: response.statusMessage.toString()));
    }
    }catch(error){
      emit(GetPostsError(message: "Internal Server Error"));
    }
  }

}
