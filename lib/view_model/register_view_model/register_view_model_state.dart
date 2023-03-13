import 'package:equatable/equatable.dart';

abstract class RegisterViewModelState extends Equatable {
  const RegisterViewModelState();
}

class RegisterViewModelInitial extends RegisterViewModelState {
  @override
  List<Object> get props => [];
}
class RegisterViewModelLoading extends RegisterViewModelState {
  @override
  List<Object> get props => [];
}
class RegisterViewModelSuccess extends RegisterViewModelState {
  @override
  List<Object> get props => [];
}
class RegisterViewModelError extends RegisterViewModelState {
  final String message;
  const RegisterViewModelError({required this.message});
  @override
  List<Object> get props => [message];
}


