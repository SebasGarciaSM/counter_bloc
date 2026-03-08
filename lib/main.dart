import 'package:counter_bloc/ui/bloc/counter_bloc.dart';
import 'package:counter_bloc/ui/cubit/counter_cubit.dart';
import 'package:counter_bloc/ui/screens/counter_cubit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (_) => CounterCubit(),
        ),
        BlocProvider<CounterBloc>(
          create: (_) => CounterBloc(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterCubitScreen(),
    );
  }
}
