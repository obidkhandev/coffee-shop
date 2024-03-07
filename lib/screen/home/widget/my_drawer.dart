import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/router/route_name.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {


  bool isDark = false;

  _init() async {
    isDark = await AdaptiveTheme.getThemeMode() == AdaptiveThemeMode.dark;
    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer( // Drawer qo'shish
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, RouteName.cart);
              },
              icon: Row(
                children: [
                  Icon(Icons.shopping_cart,color: Theme.of(context).iconTheme.color,size: 32,),
                  SizedBox(width: 20.w),
                  Text("Open To Cart",style: Theme.of(context).textTheme.titleLarge,)
                ],
              ),
            ),
            IconButton(
              onPressed: (){
                context.setLocale(Locale('uz','UZ'),);
              },
              icon: Row(
                children: [
                  Image.network('https://pic.rutubelist.ru/video/1d/60/1d60761882e675a2cae9aa83df181115.jpg',width: 40,),
                  SizedBox(width: 20.w),
                  Text("uzbek_til".tr(),style: Theme.of(context).textTheme.titleLarge,)
                ],
              ),
            ),
            IconButton(
              onPressed: (){
                context.setLocale(Locale('en','US'),);
              },
              icon: Row(
                children: [
                  Image.network('https://w7.pngwing.com/pngs/434/104/png-transparent-uk-national-flag-illustration-flag-of-great-britain-flag-of-the-united-kingdom-british-flag-miscellaneous-blue-flag.png',width: 40,),
                  SizedBox(width: 20.w),
                  Text("english_tili".tr(),style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
            IconButton(
              onPressed: (){
                context.setLocale(Locale('en','US'),);
              },
              icon: Row(
                children: [
                  Switch(value: isDark, onChanged: (v){
                    if (v) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                    isDark = v;

                  }),
                  SizedBox(width: 20.w),
                  Text("theme".tr(),style: Theme.of(context).textTheme.titleLarge),
                ],
              ),
            ),
          ],
        ),
      ),);
  }
}
