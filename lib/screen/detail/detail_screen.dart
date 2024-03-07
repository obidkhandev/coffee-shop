import 'dart:async';

import 'package:coffee_shop/data/local/local_database.dart';
import 'package:coffee_shop/utils/color/app_color.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/model/coffee_model.dart';
import 'my_size.dart';

class DetailScreen extends StatefulWidget {
  final List<dynamic> items;
  const DetailScreen({super.key, required this.items});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  CoffeeModel coffeeModel = CoffeeModel.initalValue;

  StreamController<bool> streamController = StreamController();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 424.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).indicatorColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(widget.items[1],
                        fit: BoxFit.fill, height: 340, width: double.infinity),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        // materialainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.items.first,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 24),
                          ),
                          Spacer(),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Text('4.6',
                              style: Theme.of(context).textTheme.titleSmall),
                          SizedBox(width: 10.w),
                          Text(
                            '(1,250)',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "With Chocolate",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFFFFFF80).withOpacity(0.5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$ 120",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 22,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              coffeeModel = CoffeeModel(
                                name: widget.items[0],
                                description: 'description_two'.tr(),
                                subtitle: 'Chocolate',
                                createdAt: DateTime.now(),
                                price: widget.items[2],
                                type: 'Cappucino',
                                rate: 4.6,
                              );

                              LocalDatabase.insertTask(
                                coffeeModel
                              );
                              streamController.add(true);
                            },
                            child: Container(
                              height: 36.h,
                              width: 130.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                "add_to_cart".tr(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text("description".tr(),
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 10.h),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'description_two'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey, fontSize: 16),
                  ),
                  TextSpan(
                    text: 'read_more'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.primary, fontSize: 16),
                  ),
                ]),
              ),
              SizedBox(height: 20.h),
              Text("Size", style: Theme.of(context).textTheme.titleLarge),
              SizedBox(height: 10.h),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MySize(size: "S"),
                  MySize(size: "M"),
                  MySize(size: "L"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
