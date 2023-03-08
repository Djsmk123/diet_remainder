import 'package:auto_route/auto_route.dart';
import 'package:diet_remainder/gen/assets.gen.dart';
import 'package:diet_remainder/routing/router_dat.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:introduction_screen/introduction_screen.dart';

class IntroScreenView extends StatefulWidget {
  const IntroScreenView({super.key});

  @override
  State<IntroScreenView> createState() => _IntroScreenViewState();
}

class _IntroScreenViewState extends State<IntroScreenView> {
  List<PageViewModel> pageViewModel = [
    PageViewModel(
      title: 'Diet Remainder',
      body: 'Diet Remainder is a diet reminder app which will help you to maintain your diet and achieve your goal with proper time table',
      image: Center(child: Assets.images.intro1.image()),
    ),
    PageViewModel(
      title: 'You will never forget to eat',
      body:
          'Get notified when it is time to eat and never forget to eat again and maintain your diet with proper time table',
      image: Center(child: Assets.images.intro2.image()),
    ),
    PageViewModel(
      title: 'Want to lose weight or gain weight?',
      body:
          'Diet Remainder will help you to maintain your diet and help you to achieve your goal and track your progress',
      image: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
  ),
        child: Center(child: Assets.images.intro3.image()),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: IntroductionScreen(
        pages: pageViewModel,
        onDone: () {
          // When done button is press
          context.router.push(const RegisterScreenView());
        },
        onSkip: () {
          context.router.push(const RegisterScreenView());
        },
        showSkipButton: true,
        skip: Text('Skip', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16.sp)),
        next: const Icon(Icons.arrow_forward),
        done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeColor: Colors.lightBlue,
          activeSize: Size(22.0, 10.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
