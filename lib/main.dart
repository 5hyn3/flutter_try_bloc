import 'package:flutter_try_bloc/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try_bloc/screens/counter_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Provider<CounterBloc>(
          create: (context) => CounterBloc(),
          dispose: (context, bloc) => bloc.dispose(),
          child: CounterScreen(title: 'Flutter Demo Home Page'),
        ));
  }
}
