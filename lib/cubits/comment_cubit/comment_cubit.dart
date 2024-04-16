import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled9/model/comment_model.dart';
import 'package:untitled9/network/dio_helper.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial());

  static CommentCubit get(context)=>BlocProvider.of(context);


  void getAllComments({
  required int postId,
  })async{
    emit(GetCommentsLoading());
    try {
      Response response = await DioHelper.getData(
        endPoint: "comments",
        queryParameters: {
          "postId": postId,
        },
      );
      if(response.statusCode == 200 || response.statusCode == 201){
        List<CommentModel> comments = [];
        for(var element in response.data){
          comments.add(CommentModel.fromJson(element));
        }
        emit(GetCommentsSuccessfully(comments: comments));
      }
      else{
        emit(GetCommentsError(message: response.statusMessage.toString()));
      }
    }catch(error){
      emit(GetCommentsError(message: error.toString()));
    }
  }
}
