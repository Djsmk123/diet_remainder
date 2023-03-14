import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
class MealsModel extends Equatable{
  final String idMeal;
  final String strMeal;
  final TimeOfDay dateMeal;
  const MealsModel({required this.idMeal, required this.strMeal, required this.dateMeal});
  @override
  // TODO: implement props
  List<Object?> get props => [idMeal, strMeal, dateMeal];
  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return MealsModel(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      dateMeal: TimeOfDay(hour: json['dateMeal']['hour'], minute: json['dateMeal']['minute']),

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'dateMeal': {
        'hour': dateMeal.hour,
        'minute': dateMeal.minute,
      },

    };
  }
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
  factory MealsModelsList.fromJson(List<dynamic> json) {
    return MealsModelsList(
      meals: json.map((e) => MealsModel.fromJson(e)).toList(),
    );
  }
   toJson() {
    return meals.map((e) => e.toJson()).toList();
  }

}
