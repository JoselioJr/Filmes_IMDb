import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_model.dart';
import '../models/film_model.dart';

class HiveService {
  static const String usersBox = 'users';
  static const String favoritesBox = 'favorites';

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(FilmAdapter());
    await Hive.openBox<User>(usersBox);
    await Hive.openBox<Film>(favoritesBox);
  }

  static Box<User> getUsersBox() => Hive.box<User>(usersBox);
  static Box<Film> getFavoritesBox() => Hive.box<Film>(favoritesBox);

  static Future<bool> registerUser(String name, String password) async {
    final box = getUsersBox();
    if (box.values.any((user) => user.name == name)) {
      return false;
    }
    await box.add(User(name: name, password: password));
    return true;
  }

  static User? authenticateUser(String name, String password) {
    final box = getUsersBox();
    try {
      return box.values.firstWhere(
        (user) => user.name == name && user.password == password,
      );
    } catch (e) {
      return null;
    }
  }

  static Future<void> addFavorite(Film film, String userId) async {
    final box = getFavoritesBox();
    final key = '${userId}_${film.title}';
    await box.put(key, film);
  }

  static Future<void> removeFavorite(String title, String userId) async {
    final box = getFavoritesBox();
    final key = '${userId}_$title';
    await box.delete(key);
  }

  static List<Film> getFavorites(String userId) {
    final box = getFavoritesBox();
    return box.keys
        .where((key) => key.toString().startsWith('${userId}_'))
        .map((key) => box.get(key)!)
        .toList();
  }

  static bool isFavorite(String title, String userId) {
    final box = getFavoritesBox();
    final key = '${userId}_$title';
    return box.containsKey(key);
  }
}