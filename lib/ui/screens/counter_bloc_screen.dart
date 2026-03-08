import 'package:counter_bloc/ui/bloc/counter_bloc.dart';
import 'package:counter_bloc/ui/bloc/counter_event.dart';
import 'package:counter_bloc/ui/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocScreen extends StatelessWidget {
  const CounterBlocScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Bloc"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: TextStyle(fontSize: 48.0),
                );
              },
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                IconButton.filled(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterIncremented());
                  },
                  icon: Icon(Icons.add),
                ),
                IconButton.filled(
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterDecremented());
                  },
                  icon: Icon(Icons.remove),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
