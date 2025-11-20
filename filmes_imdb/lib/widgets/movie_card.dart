import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/film_model.dart';
import '../controllers/movie_controller.dart';

class MovieCard extends StatelessWidget {
  final Film movie;
  final MovieController movieController = Get.find<MovieController>();

  MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                movie.imgPoster,
                width: 80,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 80,
                    height: 120,
                    color: Colors.grey[300],
                    child: const Icon(Icons.movie, size: 40),
                  );
                },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Ano: ${movie.year}'),
                  const SizedBox(height: 4),
                  Text('Rank: ${movie.rank}'),
                  const SizedBox(height: 4),
                  Text(
                    'Atores: ${movie.actors}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Obx(() => IconButton(
              icon: Icon(
                movieController.isFavorite(movie)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: movieController.isFavorite(movie)
                    ? Colors.red
                    : Colors.grey,
              ),
              onPressed: () => movieController.toggleFavorite(movie),
            )),
          ],
        ),
      ),
    );
  }
}