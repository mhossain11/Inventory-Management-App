import 'package:get/get.dart';
import '../../../../core/route/app_route.dart';
import '../../../dashboard/presentation/screens/dashboard_screen.dart';
import '../../../home/domain/models/store_model.dart';
import '../../domain/repos/auth_repo.dart';



class AuthController extends GetxController{
final AuthRepo _authRepo;

AuthController(this._authRepo);

@override
  void onInit() {
    super.onInit();
    getStoreData();
  }

var isLoading = false.obs;
var errorMessage = RxnString();
var storeList = <StoreModel>[].obs;

Future<void>login({
  required String email,
  required String password,
})async {
  isLoading.value = true;
  final result = await _authRepo.login(
      email: email,
      password: password);
  result.fold(
          (failure) {
        errorMessage.value = failure.message;
        isLoading.value = false;
      },
          (_) {
       // Get.snackbar('Success', 'Login successful');
        isLoading.value = false;
        Get.offAllNamed(AppRoutes.dashboardScreen);
      });
}

/*Future<void> register({
  required String firstname,
  required String lastname,
  required String email,
  required String phone,
  required String password,
  required String confirmPassword,
}) async {
  isLoading.value = true;
  final result = await _authRepo.register(
    firstname: firstname,
    lastname: lastname,
    email: email,
    phone: phone,
    password: password,
    confirmPassword: confirmPassword,
  );
  result.fold(
          (failure) {
        errorMessage.value = failure.message;
        Get.snackbar('Error', failure.message);
        isLoading.value = false;
      }, (_) {
    Get.snackbar('Success', 'Registration successful');
    isLoading.value = false;
    Get.offAll(() => const LoginScreen());
  });
}*/



  Future<void> getStoreData() async{
    try{
      isLoading.value = true;
      final result = await _authRepo.getStoreData();
      result.fold(
              (failure) {
            errorMessage.value = failure.message;
          },
              (data) {
            storeList.addAll(data);
          }
      );
      isLoading.value = false;
    }catch(e){
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }finally{
      isLoading.value = false;
    }
  }
}