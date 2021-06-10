part of 'randomcontainers_bloc.dart';

@immutable
class RandomcontainersState {
  final double thewidth;
  final double theheight;
  final Color thecolor;
  final BorderRadiusGeometry theborderRadius;
  RandomcontainersState({
    required this.thewidth,
    required this.theheight,
    required this.thecolor,
    required this.theborderRadius,
  });
}
