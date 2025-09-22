import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:inventoryapp/core/route/app_route.dart';
import 'package:inventoryapp/core/route/getx_route.dart';
import 'package:inventoryapp/features/auth/presentation/screens/login_screen.dart';
import 'package:inventoryapp/features/splash/presentation/screens/splash_screen.dart';

import 'controller_binder.dart';
import 'core/di_inject/injection_container.main.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(ScreenUtilInit(
    designSize: const Size(360, 690),

    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context,child)=> const ProviderScope(child: MyApp()),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: ControllerBinder(),
      initialRoute: AppRoutes.initial,
      debugShowCheckedModeBanner: false,
      getPages: GetRoute().getRoutes(),
    );
  }
}

