import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/main/presentation/cubit/post/posts_cubit.dart';
import '../features/main/presentation/cubit/todo/todo_cubit.dart';
import '../features/main/presentation/screens/home_screen.dart';
import '../locator.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {

  late TodoCubit todoCubit;
  late PostsCubit postsCubit;
  @override
  void initState() {
    todoCubit = locator();
    postsCubit = locator();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: postsCubit),
        BlocProvider.value(value: todoCubit),
      ],
      child: MaterialApp(
        title: 'Cache App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.green.shade100,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
            )
          ),
          appBarTheme: const AppBarTheme(
            color: Colors.green,
            foregroundColor: Colors.white,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            )

          )
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
