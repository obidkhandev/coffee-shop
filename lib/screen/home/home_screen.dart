import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_shop/screen/home/widget/coffee_item.dart';
import 'package:coffee_shop/screen/home/widget/my_drawer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Image.asset(
                'assets/images/Group 1.png',
                color: Theme.of(context).iconTheme.color,
              ),
            );
          },
        ),
        actions: [
          Icon(Icons.search, color: Theme.of(context).iconTheme.color),
          SizedBox(width: 10.w),
          Icon(Icons.favorite_border, color: Theme.of(context).iconTheme.color),
          SizedBox(width: 16.w),
        ],
      ),
      drawer: MyDrawer(),
     
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("your_favorites".tr(),
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 424,
                  width: double.infinity,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: 424,

                      viewportFraction: 0.8,

                      initialPage: 0,
                      enableInfiniteScroll: false,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: const [
                      CoffeeItems(
                          name: "Cappucino",
                          img: "assets/images/unsplash_c2Y16tC3yO8.png",
                          price: 120),
                      CoffeeItems(
                          name: "Mocha",
                          img: "assets/images/coffee1.webp",
                          price: 120),
                      // Add more CoffeeItems here as needed
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text("popular_now".tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 20.h),
                SizedBox(height: 24.h,width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,

                  children: [

                    Text("All",style: Theme.of(context).textTheme.titleMedium ,),
                    SizedBox(width: 20.w),
                    Text("Mocha",style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(width: 20.w),
                    Text("Latte",style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(width: 20.w),
                    Text("Cappucino",style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(width: 20.w),
                    Text("Espresso",style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(width: 20.w),
                    Text("Black",style: Theme.of(context).textTheme.titleMedium),
                    SizedBox(width: 20.w),
                  ],
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: GridView.builder(
                      itemCount: 4,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                        mainAxisExtent: 200

                  ), itemBuilder: (context,index){
                    return Image.network("https://w.forfun.com/fetch/ac/ac5fbdf8d64e79c2c3026fab11d0ed74.jpeg",fit: BoxFit.cover,height: 100.h);

                  })
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
