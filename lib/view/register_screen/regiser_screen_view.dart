// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:diet_remainder/core/widgets/custom_rounded_button.dart';
import 'package:diet_remainder/core/widgets/custom_snack_bar.dart';
import 'package:diet_remainder/model/meals_model.dart';
import 'package:diet_remainder/view/register_screen/widgets/custom_text_field.dart';
import 'package:diet_remainder/view/register_screen/widgets/dropdownbutton_widget.dart';
import 'package:diet_remainder/view/register_screen/widgets/steps_widget.dart';
import 'package:diet_remainder/view_model/register_view_model/register_view_model_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/colors.dart';

class RegisterScreenView extends StatefulWidget {
  const RegisterScreenView({super.key});

  @override
  _RegisterScreenViewState createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  List<int> requiredNoOfGlassWater = [
    3,
    4,
    5,
    6,
    7,
    8,
  ];
  MealsModelsList mealsModelsList = MealsModelsList(meals: [
    MealsModel(
      idMeal: '1',
      strMeal: 'Breakfast',
      dateMeal: DateTime.now(),
      isCompleted: false,
    ),
    MealsModel(
      idMeal: '2',
      strMeal: 'Lunch',
      dateMeal: DateTime.now(),
      isCompleted: false,
    ),
    MealsModel(
      idMeal: '3',
      strMeal: 'Dinner',
      dateMeal: DateTime.now(),
      isCompleted: false,
    ),
  ]);
  int selectedNoOfGlassWater = 3;
  List<int> requiredNoOfMeals = [
    3,
    4,
    5,
    6,
    7,
    8,
  ];
  int selectedNoOfMeals = 3;
  final TextEditingController _targetedWeight = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _targetedWeight.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Registration'),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<RegisterViewModelBloc,RegisterViewModelState>(
          builder: (BuildContext context, state) {
            if(state is RegisterViewModelLoading){
              return Center(child: CircularProgressIndicator(
                color: ColorsScheme.kPrimaryColor,
              ),);
            }
            if(state is RegisterViewModelDietRegistration){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h,),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Text(
                            'Diet Details',
                            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: ColorsScheme.kPrimaryColor,
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: DropDownButtonWidget<int>(
                            value: selectedNoOfMeals,
                            onChange: (value){
                              setState(() {
                                selectedNoOfMeals=value!;
                              });
                            },
                            items: requiredNoOfMeals,
                            msg: "Select no. of meals you required",
                          ),
                        ),
                        ListView.builder(
                            itemCount: selectedNoOfMeals,
                            shrinkWrap: true,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: DropDownButtonWidget<MealsModel>(
                                  value: mealsModelsList.meals[index],
                                  onChange: (value){
                                    setState(() {
                                      mealsModelsList.meals[index]=value!;
                                    });
                                  },
                                  items: mealsModelsList.meals,
                                  msg: "Select meal ${index+1}",
                                ),
                              );
                            })
                      ],
                    )
                  )
                ],
              );
            }
            return Column(
              children: [
                Form(
                  key: _formKey,
                  child: Stepper(
                    currentStep: _currentStep,
                    onStepTapped: (index) {
                      setState(() {
                        _currentStep = index;
                      });
                    },
                    controlsBuilder: (BuildContext ctx, ControlsDetails dtl) {
                     return emptyWidget();
                    },
                    onStepContinue: onStepContinue,
                    onStepCancel: onStepCancel,
                    steps: [
                      StepWidget(
                        stepTitle: 'Name',
                        context: context,
                        isActive: _currentStep == 0,
                        content: CustomTextFieldRegister(
                          controller: _nameController,
                          keyboardType: TextInputType.name,
                          onSubmitted: (value) {
                            onStepContinue();
                          },
                          hintText: 'Enter your name',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                      StepWidget(
                        stepTitle: 'Age(optional)',context: context,
                        isActive: _currentStep == 1,
                        content: CustomTextFieldRegister(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          onSubmitted: (value) {
                            onStepContinue();
                          },
                          hintText: 'Enter your age',
                        ),

                      ),
                      StepWidget(
                        stepTitle: 'Weight',context: context,
                        isActive: _currentStep == 2,
                        content: CustomTextFieldRegister(
                          controller: _weightController,
                          keyboardType: TextInputType.number,
                          suffixIcon:  Icon(
                            Icons.monitor_weight_outlined,
                            color: ColorsScheme.kPrimaryColor,
                          ),
                          onSubmitted: (value) {
                            onStepContinue();
                          },
                          hintText: 'Enter your weight in kg',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your weight';
                            }else if(int.parse(value) < 30 || int.parse(value) > 200){
                              return 'Please enter a valid weight';
                            }
                            return null;
                          },
                        ),
                      ),
                      StepWidget(
                        stepTitle: 'Height',
                        context: context,
                        isActive: _currentStep == 3,
                        content: CustomTextFieldRegister(
                          controller: _heightController,
                          keyboardType: TextInputType.number,
                          onSubmitted: (value) {
                            onStepContinue();
                          },
                          suffixIcon: Icon(
                            Icons.height_outlined,
                            color: ColorsScheme.kPrimaryColor,
                          ),
                          hintText: 'Enter your height in cm',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your weight';
                            }else if(int.parse(value) < 100 || int.parse(value) > 250){
                              return 'Please enter a valid height';
                            }
                            return null;
                          },
                        ),
                      ),
                      StepWidget(
                        stepTitle: 'Targeted Weight (optional)',
                        context: context,
                        isActive: _currentStep == 4,
                        content: CustomTextFieldRegister(
                          controller: _targetedWeight,
                          keyboardType: TextInputType.number,
                          onSubmitted: (value) {
                            onStepContinue();
                          },
                          suffixIcon: Icon(
                            Icons.monitor_weight_outlined,
                            color: ColorsScheme.kPrimaryColor,
                          ),
                          hintText: 'Enter your targeted weight in kg',
                          validator: (value) {
                            try{
                              if(int.parse(value!) < 30 || int.parse(value) > 200){
                                return 'Please enter a valid targeted weight';
                              }
                            }catch(e){
                              log(e.toString());
                            }

                            return null;
                          },
                        ),

                      ),
                      StepWidget(context: context,
                          isActive: _currentStep==5, stepTitle: 'Water Requirement(in Glass)',
                          content: DropDownButtonWidget<int>(
                            value: selectedNoOfGlassWater,
                            onChange: (value){
                              setState(() {
                                selectedNoOfGlassWater=value!;
                              });
                            },
                            items: requiredNoOfGlassWater,
                            msg: "Select no. of water glasses in day",
                          )
                      ),
                      StepWidget(context: context,
                          isActive: _currentStep==6, stepTitle: 'Meals Requirment',
                          content: DropDownButtonWidget<int>(
                            value: selectedNoOfMeals,
                            onChange: (value){
                              setState(() {
                                selectedNoOfMeals=value!;
                              });
                            },
                            items: requiredNoOfMeals,
                            msg: "Select no. of meals you required",
                          )
                      ),



                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                RoundedButton(
                  onTap: (){
                    if(!_formKey.currentState!.validate()){
                      _formKey.currentState!.save();

                      BlocProvider.of<RegisterViewModelBloc>(context).add(RegisterViewModelDietRegistrationEvent());

                    }else{
                      customSnackBar( context: context, msg: 'Please fill all the fields',isSuccess: false);
                    }
                  },
                  text: 'Next Step',

                )

              ],
            );
          },
        ),
      ),
    );
  }
  onStepContinue() {
    setState(() {
      if (_currentStep < 5) {
        //open keyboard to next step
        FocusScope.of(context).requestFocus(FocusNode());
        _currentStep++;
      }
    });
  }
  onStepCancel() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      }
    });
  }
  Widget emptyWidget(){
     return const SizedBox(
      height: 0,
      width: 0,
    );
  }
}



