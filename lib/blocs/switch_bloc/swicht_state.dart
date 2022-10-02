part of 'swicht_bloc.dart';

class SwichtState extends Equatable {
  final bool switchvalue;
  const SwichtState({required this.switchvalue});

  @override
  List<Object> get props => [
        switchvalue,
      ];
}

class SwichtcInitialState extends SwichtState {
  const SwichtcInitialState({required bool switchvalue})
      : super(switchvalue: switchvalue);
}
