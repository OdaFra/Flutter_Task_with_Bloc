part of 'swicht_bloc.dart';

abstract class SwichtEvent extends Equatable {
  const SwichtEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends SwichtEvent {}

class SwitchOffEvent extends SwichtEvent {}
