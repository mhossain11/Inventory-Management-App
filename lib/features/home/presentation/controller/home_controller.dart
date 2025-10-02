
import 'package:get/get.dart';
import 'package:inventoryapp/features/home/domain/models/store_model.dart';
import 'package:inventoryapp/features/home/domain/repos/home_repo.dart';

class HomeController extends GetxController{
    HomeController(this.homeRepo);
  final HomeRepo homeRepo;

  @override
  void onInit() {
    super.onInit();

  }


  var loading = false.obs;
  var errorMessage = ''.obs;
  var storeList = <StoreModel>[].obs;



}