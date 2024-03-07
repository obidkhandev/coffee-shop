import 'dart:async';
import 'package:coffee_shop/utils/router/route_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(const Duration(seconds: 2),
            () => Navigator.pushReplacementNamed(context, RouteName.home));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Image.asset('assets/images/unsplash_tA90pRfL2gM (1).png'),
          SizedBox(height: 20.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
            child: Text(tr("find_the_best_coffee_for_you"),
              style: Theme.of(context).textTheme.headlineLarge,textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            child: Container(
              color: Colors.grey,
              alignment: Alignment.center,
              height: 40.h,
              width: 100.w,
              child: Text("proceed".tr(),style:Theme.of(context).textTheme.titleMedium),
            ),
          ),
        ]
      ),
    );
  }
}