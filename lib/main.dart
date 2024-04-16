import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled9/cubits/app_cubit/app_cubit.dart';
import 'package:untitled9/cubits/comment_cubit/comment_cubit.dart';
import 'package:untitled9/network/dio_helper.dart';
import 'package:untitled9/screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.initializeDio();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => AppCubit()..getAllPosts(),
        ),
        BlocProvider(
          create: (context) => CommentCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false, // Android 12
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
