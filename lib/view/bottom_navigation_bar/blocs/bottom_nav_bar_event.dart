part of 'bottom_nav_bar_bloc.dart';

abstract class BottomNavBarEvent extends Equatable {
  const BottomNavBarEvent();
}
class BottomNavBarChangedEvent extends BottomNavBarEvent {
  final int index;
  const BottomNavBarChangedEvent({required this.index});
  @override
  List<Object> get props => [index];
}