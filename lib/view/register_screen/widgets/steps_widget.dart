// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StepWidget extends Step {
  @override
  final bool isActive;
  final String stepTitle;
  @override
  final Widget content;
  final BuildContext context;

  StepWidget(
      {Key? key, required this.context, required this.isActive, required this.stepTitle, required this.content})
      : super(
      title: Text("Enter $stepTitle",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontSize: 18.sp,
      ),),
      isActive: isActive,

      state: StepState.indexed,
      content: content);
}
