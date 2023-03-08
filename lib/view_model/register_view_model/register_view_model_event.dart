part of 'register_view_model_bloc.dart';

abstract class RegisterViewModelEvent extends Equatable {
  const RegisterViewModelEvent();
}
class RegisterViewModelEventRegister extends RegisterViewModelEvent {
  final UserModel userModel;
  const RegisterViewModelEventRegister({required this.userModel});

  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}
class RegisterViewModelDietRegistrationEvent extends RegisterViewModelEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
