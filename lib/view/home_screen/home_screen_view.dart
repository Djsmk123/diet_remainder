import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../bottom_navigation_bar/bottom_navigation_bar_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;
  late bool _hideNavBar;
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }
  @override
  Widget build(BuildContext context) {
   return  Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.white,
       elevation: 0,
       leading:  Container(
          margin:  EdgeInsets.only(left: 10.w),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
            image: const DecorationImage(
              image:  NetworkImage('https://www.w3schools.com/w3images/avatar2.png'),
              fit: BoxFit.cover,
            ),
          )
       ),
       title: Text('John',style:  Theme.of(context).textTheme.bodyLarge!.copyWith(
         fontSize: 20.sp,
       ),),
     ),
    body: SingleChildScrollView(
      child:Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]!),
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: PreferredSize(
      preferredSize: Size.fromHeight(60.h),
      child: const CustomNavigationBar(),
    )
   );
  }
}
