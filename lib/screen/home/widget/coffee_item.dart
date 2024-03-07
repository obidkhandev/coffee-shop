import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/color/app_color.dart';
import 'package:coffee_shop/utils/router/route_name.dart';


class CoffeeItems extends StatelessWidget {
  final String name;
  final String img;
  final int price;
  const CoffeeItems({super.key, required this.name, required this.img, required this.price,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.pushNamed(context, RouteName.detail,arguments: [name,img,price]);
      },
      child: Container(
        height: 424.h,
        width: 256.w,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).indicatorColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.asset(img,fit: BoxFit.fill,width: double.infinity),
            ),
            SizedBox(height: 10.h),
            Text(name,style: Theme.of(context).textTheme.titleLarge),
            Text("With Chocolate",
              style: TextStyle(
                fontSize: 15,fontWeight: FontWeight.w500,color: const Color(0xFFFFFF80).withOpacity(0.5),
              ),
            ),
            // Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ $price",
                  style: const TextStyle(
                      color: AppColors.primary,fontSize: 24,fontWeight: FontWeight.w700
                  ),
                ),
                Container(
                  height: 42.h,
                  width: 42.w,
                  alignment: Alignment.center,
                  // alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                  ),
                  child: const Icon(Icons.add,color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}