
import 'package:diet_remainder/model/services/registration_service.dart';
import 'package:diet_remainder/model/user_model.dart';
import 'package:diet_remainder/view_model/register_view_model/register_view_model_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_view_model_event.dart';


class RegisterViewModelBloc extends Bloc<RegisterViewModelEvent, RegisterViewModelState> {
  RegisterViewModelBloc() : super(RegisterViewModelInitial()) {
    on<RegisterViewModelEvent>((event, emit) async {
      final UserServices userServices=UserServices();
      if(event is RegisterViewModelEventRegister){
        emit(RegisterViewModelLoading());
        final UserModel userModel=event.userModel;
        try{
          await userServices.registerUser(userModel);
        }on Exception{
          emit(const RegisterViewModelError(message: 'Database Error'));
        }

        emit(RegisterViewModelSuccess());
      }
    });
  }
}

