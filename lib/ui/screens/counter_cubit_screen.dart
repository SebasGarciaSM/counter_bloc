import 'package:counter_bloc/ui/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitScreen extends StatelessWidget {
  const CounterCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Cubit'),
      ),
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .stretch,
        children: [
          BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Center(
                child: Text(
                  state.toString(),
                  style: TextStyle(fontSize: 48.0),
                ),
              );
            },
          ),
          Row(
            mainAxisAlignment: .center,
            children: [
              IconButton.filled(
                onPressed: () {
                  context.read<CounterCubit>().increment();
                },
                icon: Icon(Icons.add),
              ),
              IconButton.filled(
                onPressed: () {
                  context.read<CounterCubit>().decrement();
                },
                icon: Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
