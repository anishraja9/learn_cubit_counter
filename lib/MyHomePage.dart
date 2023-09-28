import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_cubit_counter/counter_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final counter = BlocProvider.of<CounterCubit>(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Counter App')),
      body: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          return Center(
            child: Text(
              "$state",
              style: TextStyle(fontSize: 30),
            ),
          );
        },
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            counter.increment();
            // context.read<CounterCubit>().increment();
          },
        ),
        FloatingActionButton(
          child: Icon(Icons.minimize),
          onPressed: () {
            context.read<CounterCubit>().decrement();
          },
        )
      ]),
    );
  }
}
