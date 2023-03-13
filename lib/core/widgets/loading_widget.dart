import 'package:diet_remainder/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  final String? message;
  const LoadingWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           CircularProgressIndicator(
            color:ColorsScheme.kPrimaryColor,
          ),
          SizedBox(height: 20.h,),
          if (message != null) Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(message!,
                  maxLines: 1,
                  style: TextStyle(
                  color:Colors.black,
                  fontSize: 20.sp,
                ),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
