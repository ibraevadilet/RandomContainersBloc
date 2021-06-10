import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'randomcontainers_event.dart';
part 'randomcontainers_state.dart';

class RandomcontainersBloc
    extends Bloc<RandomcontainersEvent, RandomcontainersState> {
  final random = Random();
  RandomcontainersBloc()
      : super(
          RandomcontainersState(
              thewidth: 50,
              theheight: 50,
              thecolor: Colors.green,
              theborderRadius: BorderRadius.circular(8)),
        );

  @override
  Stream<RandomcontainersState> mapEventToState(
    RandomcontainersEvent event,
  ) async* {
    if (event is RandomEvent) {
      yield RandomcontainersState(
          thewidth: random.nextInt(300).toDouble(),
          theheight: random.nextInt(300).toDouble(),
          thecolor: Color.fromRGBO(
            random.nextInt(256),
            random.nextInt(256),
            random.nextInt(256),
            1,
          ),
          theborderRadius:
              BorderRadius.circular(random.nextInt(100).toDouble()));
    }
  }
}
