import 'package:cat_trivia/constants/constants.dart';
import 'package:cat_trivia/feature/fact/fact_bloc.dart';
import 'package:cat_trivia/feature/fact/fact_event.dart';
import 'package:cat_trivia/feature/fact/fact_state.dart';
import 'package:cat_trivia/feature/fact/widgets/action_button_widget.dart';
import 'package:cat_trivia/feature/fact/widgets/history_button_widget.dart';
import 'package:cat_trivia/feature/fact/widgets/image_container_widget.dart';
import 'package:cat_trivia/feature/history/history_screen.dart';
import 'package:cat_trivia/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FactScreen extends StatefulWidget {
  const FactScreen({Key? key}) : super(key: key);

  @override
  State<FactScreen> createState() => _FactScreenState();
}

class _FactScreenState extends State<FactScreen> {
  late FactBloc bloc;

  @override
  void initState() {
    super.initState();

    bloc = getIt<FactBloc>()..add(LoadFactEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(factScreenTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.all(middlePadding),
            child: HistoryButtonWidget(
              onTap: () {
                _navigateToHistoryScreen();
              },
            ),
          )
        ],
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocListener<FactBloc, FactState>(
          listener: (context, state) {
            if (state is FactErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<FactBloc, FactState>(
            builder: (context, state) {
              if (state is FactLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is FactSuccessState) {
                return Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ImageContainerWidget(
                        url: state.imageUrl,
                      ),
                      const SizedBox(height: middlePadding),
                      Text(
                        state.newFact.fact,
                        style: const TextStyle(fontSize: defaultFontSize),
                      ),
                      const Spacer(),
                      ActionButtonWidget(
                        onPressed: () {
                          bloc.add(LoadFactEvent());
                        },
                        text: anotherFact,
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  void _navigateToHistoryScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HistoryScreen();
        },
      ),
    );
  }
}
