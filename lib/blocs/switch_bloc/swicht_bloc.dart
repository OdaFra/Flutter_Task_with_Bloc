import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'swicht_event.dart';
part 'swicht_state.dart';

class SwichtBloc extends Bloc<SwichtEvent, SwichtState> {
  SwichtBloc() : super(const SwichtcInitialState(switchvalue: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(const SwichtState(switchvalue: true));
    });

    on<SwitchOffEvent>((event, emit) => const SwichtState(switchvalue: false));
  }
}
