import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc() : super(BottomNavBarInitial()) {
    on<BottomNavBarEvent>((event, emit) {
      if(event is BottomNavBarChangedEvent){
        switch(event.index){
          case 0:
            emit(BottomNavBarChangedHome());
            break;
          case 1:
            emit(BottomNavBarChangedDietTracker());
            break;
          case 2:
            emit(BottomNavBarChangedWeightTracker());
            break;
          case 3:
            emit(BottomNavBarChangedSettings());
            break;
        }
      }
    });
  }
}
