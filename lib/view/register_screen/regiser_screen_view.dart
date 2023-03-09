// ignore_for_file: library_private_types_in_public_api

import 'package:diet_remainder/core/widgets/custom_rounded_button.dart';
import 'package:diet_remainder/core/widgets/custom_snack_bar.dart';
import 'package:diet_remainder/core/widgets/empty_widget.dart';
import 'package:diet_remainder/model/meals_model.dart';
import 'package:diet_remainder/view/register_screen/widgets/custom_text_field.dart';
import 'package:diet_remainder/view/register_screen/widgets/dropdownbutton_widget.dart';
import 'package:diet_remainder/view/register_screen/widgets/steps_widget.dart';
import 'package:diet_remainder/view_model/register_view_model/register_view_model_bloc.dart';
import 'package:flutter/gestures.dart';
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
  MealsModelsList mealsModelsList = MealsModelsList(meals: const [
    MealsModel(
      idMeal: '1',
      strMeal: 'Breakfast',
      dateMeal: TimeOfDay(hour: 8, minute: 0),
      isCompleted: false,
    ),
    MealsModel(
      idMeal: '2',
      strMeal: 'Lunch',
      dateMeal: TimeOfDay(hour: 12, minute: 0),
      isCompleted: false,
    ),
    MealsModel(
      idMeal: '3',
      strMeal: 'Dinner',
      dateMeal: TimeOfDay(hour: 18, minute: 0),
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
              return buildDietDetailsWidget(context);
            }
            return buildPersonalDataWidget(context);
          },
        ),
      ),
    );
  }

  Column buildDietDetailsWidget(BuildContext context) {
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.food_bank_outlined,
                                  color: Colors.grey.shade500,
                                  size: 30.sp,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Diet Details',
                                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                    color: Colors.grey.shade500,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: addNewMeal, icon: Icon(Icons.add_circle,color: Colors.grey.shade500,))

                          ],
                        ),
                      ),



                      ReorderableListView.builder(
                          itemCount: selectedNoOfMeals,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          onReorder: (oldIndex, newIndex) {
                            setState(() {
                              if (newIndex > oldIndex) {
                                newIndex -= 1;
                              }
                              final mealsModel = mealsModelsList.meals.elementAt(oldIndex);
                              mealsModelsList=mealsModelsList.copyWith(
                                meals: [
                                  ...mealsModelsList.meals.sublist(0, oldIndex),
                                  ...mealsModelsList.meals.sublist(oldIndex + 1),
                                ]
                              );
                              mealsModelsList=mealsModelsList.copyWith(
                                meals: [
                                  ...mealsModelsList.meals.sublist(0, newIndex),
                                  mealsModel,
                                  ...mealsModelsList.meals.sublist(newIndex),
                                ]
                              );
                            });
                          },
                          dragStartBehavior: DragStartBehavior.start,
                          itemBuilder: (context,index){
                            return Padding(
                              key: ValueKey(mealsModelsList.meals[index].idMeal),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 10),
                                    margin: const EdgeInsets.symmetric(vertical: 10),

                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Flexible(
                                          child:ListTile(
                                            contentPadding: const EdgeInsets.all(0),
                                            horizontalTitleGap: 0,
                                            trailing: const Icon(
                                              Icons.menu,
                                              color: Colors.white,
                                            ),
                                            title:Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                            mealsModelsList.meals[index].strMeal,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 20.sp,
                                              ),
                                                  ),
                                                ),

                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.access_time,
                                                      color: Colors.white,
                                                      size: 30.sp,
                                                    ),
                                                    Text(
                                                      mealsModelsList.meals[index].dateMeal.format(context),
                                                      style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                                                        color: Colors.white,
                                                        fontSize: 20.sp,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            );
                          })
                    ],
                  )
                )
              ],
            );
  }

  Column buildPersonalDataWidget(BuildContext context) {
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
                     return const EmptyWidget();
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
                          validator: (value) {
                            try{
                              if((int.parse(value!) < 30 || int.parse(value) > 200)){
                                return 'Please enter a valid weight';
                              }
                              if(int.parse(value) > int.parse(_weightController.text)){
                                return 'Targeted weight should be less than or greater than your current weight';
                              }
                            }catch(e){
                              return 'Please enter a valid weight';
                           }
                            return null;
                          },
                          onSubmitted: (value) {
                            onStepContinue();
                          },
                          suffixIcon: Icon(
                            Icons.monitor_weight_outlined,
                            color: ColorsScheme.kPrimaryColor,
                          ),
                          hintText: 'Enter your targeted weight in kg',

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

  addNewMeal(){
    mealsModelsList=mealsModelsList.copyWith(
        meals: mealsModelsList.meals+[
          MealsModel(
            idMeal: '${mealsModelsList.meals.length+1}',
            strMeal: 'Meal ${mealsModelsList.meals.length+1}',
            dateMeal: const TimeOfDay(hour: 18, minute: 0),
            isCompleted: false,
          )
        ]
    );
    setState(() {
      selectedNoOfMeals++;
    });
  }

}




