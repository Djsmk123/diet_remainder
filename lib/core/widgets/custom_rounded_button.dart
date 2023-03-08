import 'package:diet_remainder/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedButton extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? text;
  final bool isLoading;
  final double fontSize;
  final double width;
  final double height;
  const RoundedButton({Key? key, this.onTap, this.text, this.isLoading=false, this.width=200, this.height=50,  this.fontSize=20}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ColorsScheme.kPrimaryColor,
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
          height: height.h,
          width:width.w,
          child:!isLoading?Text(
            text!,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
              fontSize:fontSize.sp ,
              fontWeight: FontWeight.bold,
            ),
          ):const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ));
  }
}