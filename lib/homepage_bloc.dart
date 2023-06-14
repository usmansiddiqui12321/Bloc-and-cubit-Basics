import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/internet_bloc/internet_bloc.dart';
import 'blocs/internet_bloc/internet_states.dart';

class MyHomePageBloc extends StatelessWidget {
  const MyHomePageBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        // ! Bloc Builder is for making Changes on Screen
        // ! Bloc Listener is for doing some actions
        // ! like snackbar

        // child: BlocBuilder<InternetBloc, InternetState>(
        // builder: (context, state) {
        // * == is to Compare value
        // * 'is' for Checking Data Type
        // * e.g : int a = 2
        // * if(a is int){}
        // * this will give value whether it is true or not
        //     if (state is InternetGainedState) {
        //       return const Text("Connected");
        //     } else if (state is InternetLostState) {
        //       return const Text("Not Connected");
        //     } else {
        //       return const Text("Loading");
        //     }
        //   },
        // ),

        // ! we Use Consumer To do Both Listen and Build
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Connected"),
                backgroundColor: Colors.green,
              ));
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Internet Disconnected"),
                backgroundColor: Colors.red,
              ));
            }
          },
          builder: (context, state) {
            if (state is InternetGainedState) {
              return const Text("Connected");
            } else if (state is InternetLostState) {
              return const Text("Not Connected");
            } else {
              return const Text("Loading");
            }
          },
        ),
      )),
    );
  }
}
