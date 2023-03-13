import 'package:diet_remainder/model/meals_model.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable{
  final String name;
  final int? age;
  final double weight;
  final double height;
  final int noOfGlassWater;
  final int noOfMeals;
  final MealsModelsList mealsModelsList;
  final double? targetWeight;

  const UserModel({required this.name, this.age,required this.weight,required this.height,required this.noOfGlassWater, required this.noOfMeals, required this.mealsModelsList, this.targetWeight});

  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    age,
    weight,
    height,
    noOfGlassWater,
    noOfMeals,
    mealsModelsList,
    targetWeight
  ];
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      age: json['age'],
      weight: json['weight'],
      height: json['height'],
      noOfGlassWater: json['noOfGlassWater'],
      noOfMeals: json['noOfMeals'],
      mealsModelsList: MealsModelsList.fromJson(json['mealsModelsList']),
      targetWeight: json['targetWeight'],
    );
  }
 Map<String,dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'weight': weight,
      'height': height,
      'noOfGlassWater': noOfGlassWater,
      'noOfMeals': noOfMeals,
      'mealsModelsList': mealsModelsList.toJson(),
      'targetWeight': targetWeight,
    };
  }
}