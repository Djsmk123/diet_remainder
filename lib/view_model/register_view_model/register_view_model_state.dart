part of 'register_view_model_bloc.dart';

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
class RegisterViewModelDietRegistration extends RegisterViewModelState {
  @override
  List<Object> get props => [];
}

