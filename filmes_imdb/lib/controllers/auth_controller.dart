import 'package:get/get.dart';
import '../models/user_model.dart';
import '../services/hive_service.dart';

class AuthController extends GetxController {
  final Rx<User?> currentUser = Rx<User?>(null);
  final RxBool isLoading = false.obs;

  bool get isLoggedIn => currentUser.value != null;

  Future<bool> login(String name, String password) async {
    isLoading.value = true;
    final user = HiveService.authenticateUser(name, password);
    if (user != null) {
      currentUser.value = user;
      isLoading.value = false;
      return true;
    }
    isLoading.value = false;
    return false;
  }

  Future<bool> register(String name, String password) async {
    isLoading.value = true;
    final success = await HiveService.registerUser(name, password);
    isLoading.value = false;
    return success;
  }

  void logout() {
    currentUser.value = null;
  }
}