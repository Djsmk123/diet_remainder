
import 'package:diet_remainder/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_view_model_event.dart';
part 'register_view_model_state.dart';

class RegisterViewModelBloc extends Bloc<RegisterViewModelEvent, RegisterViewModelState> {
  RegisterViewModelBloc() : super(RegisterViewModelInitial()) {
    on<RegisterViewModelEvent>((event, emit) {
      if(event is RegisterViewModelEventRegister){
        emit(RegisterViewModelLoading());
        emit(RegisterViewModelSuccess());
      }
      if(event is RegisterViewModelDietRegistrationEvent){
        emit(RegisterViewModelDietRegistration());
      }
      if(event is RegisterViewModelBackEvent){
        emit(RegisterViewModelInitial());
      }
    });
  }
}

