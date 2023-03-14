import 'package:diet_remainder/model/meals_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DietDetailsView extends StatefulWidget {
  const DietDetailsView({Key? key}) : super(key: key);

  @override
  State<DietDetailsView> createState() => _DietDetailsViewState();

}
class _DietDetailsViewState extends State<DietDetailsView> {

  MealsModelsList mealsModelsList = MealsModelsList(meals: const [
    MealsModel(
      idMeal: '1',
      strMeal: 'Breakfast',
      dateMeal: TimeOfDay(hour: 8, minute: 0),

    ),
    MealsModel(
      idMeal: '2',
      strMeal: 'Lunch',
      dateMeal: TimeOfDay(hour: 12, minute: 0),

    ),
    MealsModel(
      idMeal: '3',
      strMeal: 'Dinner',
      dateMeal: TimeOfDay(hour: 18, minute: 0),
    ),
  ]);

  List<int> requiredNoOfMeals = [
    3,
    4,
    5,
    6,
    7,
    8,
  ];
  int selectedNoOfMeals = 3;
  addNewMeal(){
    mealsModelsList=mealsModelsList.copyWith(
        meals: mealsModelsList.meals+[
          MealsModel(
            idMeal: '${mealsModelsList.meals.length+1}',
            strMeal: 'Meal ${mealsModelsList.meals.length+1}',
            dateMeal: const TimeOfDay(hour: 18, minute: 0),
          )
        ]
    );
    setState(() {
      selectedNoOfMeals++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
      ),
    );
  }
}