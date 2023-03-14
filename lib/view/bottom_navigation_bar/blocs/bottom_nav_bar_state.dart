part of 'bottom_nav_bar_bloc.dart';

abstract class BottomNavBarState extends Equatable {
  const BottomNavBarState();
}

class BottomNavBarInitial extends BottomNavBarState {
  @override
  List<Object> get props => [];
}
class BottomNavBarChangedHome extends BottomNavBarState {
  @override
  List<Object> get props => [];
}
class BottomNavBarChangedDietTracker extends BottomNavBarState {
  @override
  List<Object> get props => [];
}
class BottomNavBarChangedWeightTracker extends BottomNavBarState {
  @override
  List<Object> get props => [];
}
class BottomNavBarChangedSettings extends BottomNavBarState {
  @override
  List<Object> get props => [];
}