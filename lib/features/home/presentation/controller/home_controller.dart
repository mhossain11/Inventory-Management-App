
import 'package:get/get.dart';
import 'package:inventoryapp/features/dashboard/presentation/screens/dashboard_screen.dart';
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


    Future<void>storeCreate({
      required String name,
      required String description,
      required String address,
      required String image,
    }) async{
      loading.value = true;
      final result = await homeRepo.storeCreate(
        name: name,
        description: description,
        address: address,
        image: image,
      );
        result.fold(
              (failure){
                errorMessage.value = failure.message;
                Get.snackbar('Error', failure.message);
                loading.value = false;
              },
            (_) {
              loading.value = false;
              Get.snackbar('Success', 'Registration successful');
              Get.offAll(() => const DashboardScreen());
            });
    }
}