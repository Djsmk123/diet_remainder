import 'package:auto_route/auto_route.dart';
import 'package:diet_remainder/core/colors.dart';
import 'package:diet_remainder/routing/router_dat.gr.dart';
import 'package:diet_remainder/view/bottom_navigation_bar/blocs/bottom_nav_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigate(route)=>context.router.pushAndPopUntil(route, predicate: (route) => false);
    return BlocConsumer<BottomNavBarBloc, BottomNavBarState>(
      listener: (context, state) {
        if(state is BottomNavBarChangedHome){
          navigate(const HomeScreen());
        }else if(state is BottomNavBarChangedDietTracker){
          navigate(const HomeScreen());
        }else if(state is BottomNavBarChangedWeightTracker){
          navigate(const HomeScreen());
        }else{
          navigate(const HomeScreen());
        }
      },
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state is BottomNavBarChangedHome || state is BottomNavBarInitial? 0 : state is BottomNavBarChangedDietTracker ? 1 : state is BottomNavBarChangedWeightTracker ? 2 : 3,
          elevation:10,
          enableFeedback: true,
          selectedItemColor: ColorsScheme.kPrimaryColor,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          onTap: (index) {
            BlocProvider.of<BottomNavBarBloc>(context).add(BottomNavBarChangedEvent(index: index));
          },
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.food_bank),
              label: 'Diet Tracker',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.monitor_weight_outlined),
              label: 'Weight Tracker',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        );
      },
    );
  }

}
