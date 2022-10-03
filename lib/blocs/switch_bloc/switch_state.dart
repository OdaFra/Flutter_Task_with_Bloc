// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool switchvalue;
  const SwitchState({required this.switchvalue});

  @override
  List<Object> get props => [switchvalue];

  Map<String, dynamic> toMap() {
    return {
      'switchvalue': switchvalue,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(
      switchvalue: map['switchvalue'] ?? false,
    );
  }
}

class SwitchInitialState extends SwitchState {
  const SwitchInitialState({required bool switchvalue})
      : super(switchvalue: switchvalue);
}
