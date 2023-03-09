import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
class MealsModel extends Equatable{
  final String idMeal;
  final String strMeal;
  final TimeOfDay dateMeal;
  final bool isCompleted;
  const MealsModel({required this.idMeal, required this.strMeal, required this.dateMeal, required this.isCompleted});
  @override
  // TODO: implement props
  List<Object?> get props => [idMeal, strMeal, dateMeal];
}

// ignore: must_be_immutable
class MealsModelsList extends Equatable{
  List<MealsModel> meals;
  MealsModelsList({required this.meals});

  @override
  // TODO: implement props
  List<Object?> get props => [meals];
  MealsModelsList copyWith({List<MealsModel>? meals}){
    return MealsModelsList(meals: meals ?? this.meals);
  }

}
