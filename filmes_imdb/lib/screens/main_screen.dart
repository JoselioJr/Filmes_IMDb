import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/movie_controller.dart';
import '../widgets/movie_card.dart';
import 'favorite_screen.dart';
import 'user_screen.dart';

class MainScreen extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();
  final MovieController movieController = Get.put(MovieController());
  final TextEditingController searchController = TextEditingController();

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes IMDb', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: () => Get.to(() => FavoriteScreen()),
          ),
          IconButton(
            icon: const Icon(Icons.person, color: Colors.white,),
            onPressed: () => Get.to(() => UserScreen()),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      labelText: 'Buscar filmes...',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      movieController.searchMovies(searchController.text);
                    }
                  },
                  child: const Text('Buscar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (movieController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              
              if (movieController.movies.isEmpty) {
                return const Center(
                  child: Text('Nenhum filme encontrado. Faça uma busca!'),
                );
              }
              
              return ListView.builder(
                itemCount: movieController.movies.length,
                itemBuilder: (context, index) {
                  final movie = movieController.movies[index];
                  return MovieCard(movie: movie);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}