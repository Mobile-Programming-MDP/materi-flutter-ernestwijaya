import 'package:flutter/material.dart';
import 'package:pilem/Screens/favorite_manager.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

  @override
  Widget build(BuildContext context) {

    final favorites = FavoriteManager.favoriteMovies;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Movies"),
      ),

      body: favorites.isEmpty
          ? const Center(
              child: Text("No favorite movies yet"),
            )
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {

                final movie = favorites[index];

                return ListTile(
                  leading: Image.network(
                    'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                  ),

                  title: Text(movie.title),

                  subtitle: Text(movie.releaseDate),

                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        favorites.remove(movie);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}