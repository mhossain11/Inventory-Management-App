
import 'package:get/get.dart';
import 'package:inventoryapp/features/home/domain/models/store_model.dart';
import 'package:inventoryapp/features/home/domain/repos/home_repo.dart';

class HomeController extends GetxController{
    HomeController(this.homeRepo);
  final HomeRepo homeRepo;


  var loading = false.obs;
  var errorMessage = ''.obs;
  var storeList = <StoreModel>[].obs;


  Future<void> getStoreData() async{
    try{
      loading.value = true;
      final result = await homeRepo.getStoreData();
      result.fold(
              (failure) {
                errorMessage.value = failure.message;
              },
              (data) {
                storeList.addAll(data);
              }
      );
      loading.value = false;
    }catch(e){
      loading.value = false;
      Get.snackbar('Error', e.toString());
    }finally{
      loading.value = false;
    }
  }
}