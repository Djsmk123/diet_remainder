import 'package:diet_remainder/core/colors.dart';
import 'package:diet_remainder/core/validator.dart';
import 'package:diet_remainder/core/widgets/custom_rounded_button.dart';
import 'package:diet_remainder/core/widgets/empty_widget.dart';
import 'package:diet_remainder/model/meals_model.dart';
import 'package:diet_remainder/model/user_model.dart';
import 'package:diet_remainder/view_model/register_view_model/register_view_model_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/custom_snack_bar.dart';
import '../widgets/widgets.dart';

class PersonalDetailsRegistrationView extends StatefulWidget {
  const PersonalDetailsRegistrationView({Key? key}) : super(key: key);

  @override
  State<PersonalDetailsRegistrationView> createState() => _PersonalDetailsRegistrationViewState();
}

class _PersonalDetailsRegistrationViewState extends State<PersonalDetailsRegistrationView> with ValidationMixin {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final TextEditingController _targetedWeight = TextEditingController();
  List<int> requiredNoOfGlassWater = [
    3,
    4,
    5,
    6,
    7,
    8,
  ];
  int selectedNoOfGlassWater = 3;
  @override
  void dispose() {
   /* _nameController.dispose();
    _ageController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _targetedWeight.dispose();*/
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                      if(isFieldEmpty(value!)){
                        return 'Please enter your name';
                      }
                      if(!isValidName(value)){
                        return 'Please enter a valid name';
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
                      if (isFieldEmpty(value!)) {
                        return 'Please enter your weight';
                      }else if(!isValidWeight(value)){
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
                      if (isFieldEmpty(value!)) {
                        return 'Please enter your weight';
                      }else if(!isValidHeight(value)){
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
                    if(value!.isNotEmpty && !isValidTargetWeight(value, _weightController.text))
                      {
                        return 'Please enter a valid targeted weight';
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
                /*final userModel = UserModel(
                  name: _nameController.text,
                  age: _ageController.text.isNotEmpty?int.parse(_ageController.text):0,
                  weight: double.parse(_weightController.text),
                  height: double.parse(_heightController.text),
                  targetWeight: _targetedWeight.text.isNotEmpty?double.parse(_targetedWeight.text):0,
                  noOfGlassWater: selectedNoOfGlassWater,
                  noOfMeals: 3,
                  mealsModelsList: mealsModelsList,
                );*/
                final userModel=UserModel
                  (name: "Smkwinner", weight: 56, targetWeight:60,height: 157, noOfGlassWater: 3, noOfMeals: 3, mealsModelsList: mealsModelsList);
                BlocProvider.of<RegisterViewModelBloc>(context).add(RegisterViewModelEventRegister(userModel: userModel));
                _formKey.currentState!.save();
              }else{
                customSnackBar( context: context, msg: 'Please fill all the fields',isSuccess: false);
              }
            },
            text: 'Next Step',

          )

        ],
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


}
