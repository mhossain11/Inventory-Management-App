import 'package:get/get.dart';
import 'package:inventoryapp/features/auth/presentation/screens/login_screen.dart';
import 'package:inventoryapp/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:inventoryapp/features/splash/presentation/screens/splash_screen.dart';
import '../../features/auth/presentation/screens/register_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/home/presentation/screens/store_create_screen.dart';
import 'app_route.dart';

class GetRoute{
  List<GetPage>getRoutes(){
    return[
      GetPage(name: AppRoutes.initial,
          page:()=> SplashScreen()),

      //auth
      GetPage(name: AppRoutes.loginScreen,
          page: ()=> LoginScreen()),
      GetPage(name: AppRoutes.registerScreen,
          page: ()=> RegisterScreen()),

      //dashboard
      GetPage(name: AppRoutes.dashboardScreen,
          page: ()=> DashboardScreen()),

      //home
      GetPage(name: AppRoutes.homeScreen,
          page: ()=> HomeScreen()),
      GetPage(name: AppRoutes.storeCreateScreen,
          page: ()=> StoreCreateScreen()),




    ];
  }
}