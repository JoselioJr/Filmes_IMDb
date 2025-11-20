import 'package:get/get.dart';
import '../models/film_model.dart';
import '../services/api_service.dart';
import '../services/hive_service.dart';
import 'auth_controller.dart';

class MovieController extends GetxController {
  final RxList<Film> movies = <Film>[].obs;
  final RxList<Film> favorites = <Film>[].obs;
  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs;

  final AuthController authController = Get.find<AuthController>();

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) return;
    
    isLoading.value = true;
    searchQuery.value = query;
    movies.value = await ApiService.searchMovies(query);
    isLoading.value = false;
  }

  void loadFavorites() {
    if (authController.isLoggedIn) {
      favorites.value = HiveService.getFavorites(authController.currentUser.value!.name);
    }
  }

  Future<void> toggleFavorite(Film film) async {
    if (!authController.isLoggedIn) return;

    final userId = authController.currentUser.value!.name;
    
    if (HiveService.isFavorite(film.title, userId)) {
      await HiveService.removeFavorite(film.title, userId);
    } else {
      await HiveService.addFavorite(film, userId);
    }
    
    loadFavorites();
  }

  bool isFavorite(Film film) {
    if (!authController.isLoggedIn) return false;
    return favorites.any((fav) => fav.title == film.title);
  }
}