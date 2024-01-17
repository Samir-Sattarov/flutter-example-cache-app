import 'package:cache_example_app/features/main/presentation/screens/posts_screen.dart';
import 'package:cache_example_app/features/main/presentation/screens/todos_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomeScreen());

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cache example app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, TodosScreen.route());
              },
              child: const Text("TODOS"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, PostsScreen.route());
              },
              child: const Text("POSTS"),
            ),
          ],
        ),
      ),
    );
  }
}
