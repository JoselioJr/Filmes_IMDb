import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/movie_controller.dart';
import '../widgets/movie_card.dart';

class FavoriteScreen extends StatelessWidget {
  final MovieController movieController = Get.find<MovieController>();

  FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filmes Favoritos', style: TextStyle(color: Colors.white)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Obx(() {
        if (movieController.favorites.isEmpty) {
          return const Center(
            child: Text('Nenhum filme favorito ainda.'),
          );
        }
        
        return ListView.builder(
          itemCount: movieController.favorites.length,
          itemBuilder: (context, index) {
            final movie = movieController.favorites[index];
            return MovieCard(movie: movie);
          },
        );
      }),
    );
  }
}