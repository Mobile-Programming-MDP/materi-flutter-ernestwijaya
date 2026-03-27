import 'package:flutter/material.dart';
import 'package:pilem/screens/favorite_manager.dart';
import 'package:pilem/models/movie.dart';



class DetailScreen extends StatefulWidget {
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  void toggleFavorite() {
    setState(() {
      if (FavoriteManager.favoriteMovies.contains(widget.movie)) {
        FavoriteManager.favoriteMovies.remove(widget.movie);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Removed from favorites")),
        );
      } else {
        FavoriteManager.favoriteMovies.add(widget.movie);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Added to favorites")),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    bool isFavorite =
        FavoriteManager.favoriteMovies.contains(widget.movie);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Image.network(
                'https://image.tmdb.org/t/p/w500${widget.movie.backdropPath}',
                height: 300,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),

              const Text(
                'Overview:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              Text(widget.movie.overview),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.blue,
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    'Release Date:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(widget.movie.releaseDate),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    'Rating:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Text(widget.movie.voteAverage.toString()),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [

                  Icon(
                    isFavorite
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Colors.red,
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    'Favorite:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: toggleFavorite,
                    child: Text(
                      isFavorite ? "Remove" : "Add",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}