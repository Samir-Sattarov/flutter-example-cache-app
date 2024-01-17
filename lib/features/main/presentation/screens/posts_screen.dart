import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/error_flash_bar.dart';
import '../../domain/entities/post_results_entity.dart';
import '../cubit/post/posts_cubit.dart';
import '../widget/post_card_widget.dart';

class PostsScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const PostsScreen());

  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  PostResultsEntity postResults = PostResultsEntity.empty();

  @override
  void initState() {
    BlocProvider.of<PostsCubit>(context).load();
    super.initState();
  }

  @override
  void dispose() {
    postResults = PostResultsEntity.empty();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Posts Screen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<PostsCubit, PostsState>(
        listener: (BuildContext context, PostsState state) {
          if (state is PostsError) {
            ErrorFlushBar(state.message).show(context);
          }
          if (state is PostsLoaded) {
            postResults = state.results;
          }
        },
        builder: (context, state) {
          if (state is PostsLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: postResults.posts.length,
              itemBuilder: (context, index) {
                final e = postResults.posts[index];
                return PostCardWidget(
                  entity: e,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
