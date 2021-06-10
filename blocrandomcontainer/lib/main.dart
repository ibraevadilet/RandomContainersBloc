import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/randomcontainers_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RandomcontainersBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer Demo'),
      ),
      body: Center(
        child: BlocBuilder<RandomcontainersBloc, RandomcontainersState>(
          builder: (context, state) {
            if (state is RandomcontainersState) {
              return AnimatedContainer(
                width: state.thewidth,
                height: state.thewidth,
                decoration: BoxDecoration(
                  color: state.thecolor,
                  borderRadius: state.theborderRadius,
                ),
                duration: Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              );
            } else
              return Text("Error");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<RandomcontainersBloc>(context).add(RandomEvent());
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
