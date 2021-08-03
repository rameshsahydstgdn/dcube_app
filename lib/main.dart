import 'package:dcube_app/bloc/dictionary_cubit.dart';
import 'package:dcube_app/repository/word_repository.dart';
import 'package:dcube_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => DictionaryCubit(WordRepository()),
        child: HomeScreen(),
      ),
    );
  }
}
