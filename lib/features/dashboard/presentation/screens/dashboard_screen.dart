
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:inventoryapp/core/route/app_route.dart';
import 'package:inventoryapp/features/dashboard/presentation/controller/dasboard_controller.dart';
import 'package:inventoryapp/features/home/presentation/screens/cash_screen.dart';
import 'package:inventoryapp/features/home/presentation/screens/home_screen.dart';
import 'package:inventoryapp/features/profile/presentation/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../home/presentation/widgets/address_bottom_sheet.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController navController = Get.find<DashboardController>();

  //screen
  final screen= [
    HomeScreen(),
    CashScreen(),
    ProfileScreen()
  ];

  //screen Icon
  final item = [
    Icon(Icons.home,size: 30,),
    Icon(Icons.tab_sharp,size: 30,),
    Icon(Icons.person,size: 30,),
  ];

  //token check
  void changeIndex(int newIndex) async {
    final prefs = await SharedPreferences.getInstance();
    const accessTokenKey = 'user-access-token';
    final accessToken = prefs.getString(accessTokenKey);

    if (accessToken == null || accessToken.isEmpty) {
      // যদি user লগইন না করে থাকে → LoginScreen এ নিয়ে যাবে
      print('Token:${accessToken.toString()}');
      Get.toNamed(AppRoutes.loginScreen);
    } else {
      // লগইন করা থাকলে → সেই index অনুযায়ী screen দেখাবে
      setState(() {
        if (kDebugMode) {
          print('2Token:${accessToken.toString()}');
        }
        navController.activeNavIndex.value = newIndex;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        child: CurvedNavigationBar(
          color: Colors.blue.shade300,
          buttonBackgroundColor: Colors.blue.shade200,
          backgroundColor: Colors.transparent,
          height: 60,
          index: navController.activeNavIndex.value,
          items: item,
          onTap: (index) {
            navController.activeNavIndex.value = index;
            changeIndex(index);
          },
        ),
      ),
      body: screen[navController.activeNavIndex.value],
    ));
  }


}
