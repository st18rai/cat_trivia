import 'package:cat_trivia/constants/constants.dart';
import 'package:cat_trivia/feature/history/history_bloc.dart';
import 'package:cat_trivia/feature/history/history_event.dart';
import 'package:cat_trivia/feature/history/history_state.dart';
import 'package:cat_trivia/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late HistoryBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = getIt<HistoryBloc>()..add(HistoryLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(historyScreenTitle),
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocListener<HistoryBloc, HistoryState>(
          listener: (context, state) {
            if (state is HistoryErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(errorMessage),
                ),
              );
            }
          },
          child: BlocBuilder<HistoryBloc, HistoryState>(
            builder: (context, state) {
              if (state is HistoryLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is HistoryLoadedState) {
                return ListView.builder(
                  itemCount: state.facts.length,
                  itemBuilder: (context, listIndex) {
                    final factInfo = state.facts[listIndex];

                    if (factInfo.fact.isNotEmpty) {
                      return ListTile(
                        title: Text(
                          factInfo.fact,
                          style: const TextStyle(fontSize: defaultFontSize),
                        ),
                        subtitle: Text(
                          DateFormat('d MMM').format(factInfo.createdAt),
                          style: const TextStyle(fontSize: smallFontSize),
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
