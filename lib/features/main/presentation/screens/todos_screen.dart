import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/error_flash_bar.dart';
import '../../domain/entities/todo_results_entity.dart';
import '../cubit/todo/todo_cubit.dart';
import '../widget/todo_card_widget.dart';

class TodosScreen extends StatefulWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const TodosScreen());

  const TodosScreen({Key? key}) : super(key: key);

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  TodoResultsEntity todoResults = TodoResultsEntity.empty();

  @override
  void initState() {
    BlocProvider.of<TodoCubit>(context).load();
    super.initState();
  }


  @override
  void dispose() {
    todoResults = TodoResultsEntity.empty();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Todos screen",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocConsumer<TodoCubit, TodoState>(
        listener: (BuildContext context, TodoState state) {
          if (state is TodoError) {
            ErrorFlushBar(state.message).show(context);
          }
          if (state is TodoLoaded) {
            todoResults = state.results;
          }
        },
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: todoResults.todos.length,
              itemBuilder: (context, index) {
                final e = todoResults.todos[index];
                return TodoCardWidget(
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
