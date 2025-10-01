
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventoryapp/features/dashboard/presentation/controller/dasboard_controller.dart';
import 'package:inventoryapp/features/home/presentation/screens/home_screen.dart';
import 'package:inventoryapp/features/profile/presentation/screens/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static String path ='/dashboard';

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DashboardController navController = Get.find<DashboardController>();

  //screen
  final screen= [
    HomeScreen(),
   // StoreCreateScreen(),
    ProfileScreen()
  ];

  //screen Icon
  final item = [
    Icon(Icons.home,size: 30,),
    //Icon(Icons.tab_sharp,size: 30,),
    Icon(Icons.person,size: 30,),
  ];


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
          },
        ),
      ),
      body: screen[navController.activeNavIndex.value],
    ));
  }


}
