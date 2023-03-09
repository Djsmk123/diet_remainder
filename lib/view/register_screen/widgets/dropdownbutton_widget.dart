import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DropDownButtonWidget<T> extends StatelessWidget {
  final String msg;
  final T value;
  final List<T> items;
  final Function(T?) onChange;
  const DropDownButtonWidget({Key? key, required this.value, required this.items, required this.onChange, required this.msg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade500,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(16.r)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
           Text(msg,style: Theme.of(context).textTheme.bodySmall!.copyWith(
             color: Colors.black,
             fontSize: 14.sp,

           ),),
          DropdownButton<T>(
              value: value,
              underline: const SizedBox(),
              onChanged: onChange,
              items: items.map<DropdownMenuItem<T>>((e) =>
                  DropdownMenuItem<T>(value: e, child: Text(e.toString()))
              ).toList()
          ),
        ],
      ),
    );
  }
}
