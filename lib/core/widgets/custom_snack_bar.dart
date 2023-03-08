import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void customSnackBar({required BuildContext context,required String msg,bool isSuccess=true})=> ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Flexible(child: Text(msg,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color:Colors.white,fontSize: 16.sp,),)),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),

        backgroundColor: isSuccess?Colors.green[900]:Colors.red[900],
        duration: const Duration(seconds: 2),
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        showCloseIcon: true,
        closeIconColor: Colors.white,
        elevation: 5,

        behavior: SnackBarBehavior.floating,
      ),
    );