// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:diet_remainder/core/widgets/loading_widget.dart';
import 'package:diet_remainder/routing/router_dat.gr.dart';
import 'package:diet_remainder/view/register_screen/views/personal_details_registration_view.dart';
import 'package:diet_remainder/view_model/register_view_model/register_view_model_bloc.dart';
import 'package:diet_remainder/view_model/register_view_model/register_view_model_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/widgets/custom_snack_bar.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({super.key});

  @override
  _RegisterScreenViewState createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: BlocConsumer<RegisterViewModelBloc,RegisterViewModelState>(
        listener: (BuildContext context, state) {
          if(state is RegisterViewModelSuccess) {
            context.router.pushAndPopUntil(const HomeScreen(), predicate: (route) => false);
          }
          if(state is RegisterViewModelError) {
           customSnackBar(
              context: context,
              msg: state.message,
              isSuccess: false,
           );

          }
        },
        builder: (BuildContext context, state) {
          if(state is RegisterViewModelLoading) {
            return const LoadingWidget(message: 'Loading');
          }

          return const PersonalDetailsRegistrationView();
        },
      ),
    );
  }
}

