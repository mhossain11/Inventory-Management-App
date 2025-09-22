


import 'package:get/get.dart';

import 'core/di_inject/injection_container.main.dart';
import 'features/auth/presentation/controller/auth_controllere.dart';
import 'features/dashboard/presentation/controller/dasboard_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController(sl()));
    Get.put(DashboardController());



  }

}