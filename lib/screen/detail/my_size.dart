import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MySize extends StatelessWidget {
  final String size;
  const MySize({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 38.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(size,style: TextStyle(color: Colors.white,fontSize: 18),),
    );
  }
}
