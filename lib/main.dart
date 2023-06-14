import 'package:bloc_explained/Cubit/Internet_Cubit.dart';
import 'package:bloc_explained/homepage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // ! create: (context) => InternetBloc(),

      create: (context) => InternetCubit(),

      // * Poori App mn InternetBloc() available rahyga
      // * Because it is Global Bloc
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePageCubit(),
      ),
    );
  }
}
