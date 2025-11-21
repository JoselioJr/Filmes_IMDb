import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/film_model.dart';
import '../controllers/movie_controller.dart';
import '../screens/movie_detail_screen.dart';

class MovieCard extends StatelessWidget {
  final Film movie;
  final MovieController movieController = Get.find<MovieController>();

  MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => MovieDetailScreen(movie: movie)),
      child: Card(
        margin: const EdgeInsets.all(8.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(8.0)),
                  child: Image.network(
                    movie.imgPoster,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.grey[300],
                        child: const Icon(Icons.movie, size: 60),
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Obx(() => CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.9),
                    radius: 20,
                    child: IconButton(
                      icon: Icon(
                        movieController.isFavorite(movie)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: movieController.isFavorite(movie)
                            ? Colors.red
                            : Colors.grey,
                        size: 20,
                      ),
                      onPressed: () => movieController.toggleFavorite(movie),
                    ),
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      '${movie.year}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '#${movie.rank}',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }
}