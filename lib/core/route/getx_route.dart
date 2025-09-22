import 'package:get/get.dart';
import 'package:inventoryapp/features/auth/presentation/screens/login_screen.dart';
import 'package:inventoryapp/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:inventoryapp/features/splash/presentation/screens/splash_screen.dart';
import 'app_route.dart';

class GetRoute{
  List<GetPage>getRoutes(){
    return[
      GetPage(name: AppRoutes.initial,
          page:()=> SplashScreen()),

      GetPage(name: AppRoutes.loginScreen,
          page: ()=> LoginScreen()),

      GetPage(name: AppRoutes.dashboardScreen,
          page: ()=> DashboardScreen()),
    ];
  }
}